import * as Dialog from "@kobalte/core/dialog";
import { modalVariants } from "@heroui/styles";
import { batch, createSignal } from "solid-js";
import * as Button from "solidtype-heroui/button.jsx";
import * as CloseButton from "solidtype-heroui/close_button.jsx";
import * as FieldError from "solidtype-heroui/field_error.jsx";
import * as Form from "solidtype-heroui/form.jsx";
import * as Input from "solidtype-heroui/input.jsx";
import * as Label from "solidtype-heroui/label.jsx";
import * as TextArea from "solidtype-heroui/text_area.jsx";
import * as TextField from "solidtype-heroui/text_field.jsx";
import { call } from "./api";
import { TaskSchema } from "./board.gen";

export function make(props: { onAdded: (title: string) => void }) {
  const modal = modalVariants({});
  const backdrop = modalVariants({ variant: "blur" }).backdrop();
  const placing = modalVariants({ variant: "transparent" }).backdrop();
  const [open, setOpen] = createSignal(false);
  const [title, setTitle] = createSignal("");
  const [note, setNote] = createSignal("");
  const [tried, setTried] = createSignal(false);
  const [refused, setRefused] = createSignal<[string, string][]>([]);
  const [problem, setProblem] = createSignal("");
  const untitled = () => tried() && title().trim() === "";
  const opened = (o: boolean) =>
    batch(() => {
      if (!o) {
        setTitle("");
        setNote("");
        setTried(false);
        setRefused([]);
        setProblem("");
      }
      setOpen(o);
    });
  return (
    <Dialog.Root open={open()} onOpenChange={opened}>
      <Button.component onClick={() => opened(true)}>Add a task</Button.component>
      <Dialog.Portal>
        <Dialog.Overlay class={backdrop} />
        <div class={placing}>
          <div class={modal.container()}>
            <Dialog.Content class={modal.dialog() + " gap-5"}>
              <CloseButton.component class={modal.closeTrigger()} aria-label="Close" onClick={() => opened(false)} />
              <header class={modal.header()}>
                <Dialog.Title class={modal.heading()}>Add a task</Dialog.Title>
              </header>
              <Form.component
                onSubmit={async (e: Event) => {
                  e.preventDefault();
                  setTried(true);
                  if (untitled()) return;
                  const added = await call("POST", "/api/tasks", TaskSchema, { title: title(), note: note() === "" ? undefined : note() });
                  if (added.ok) {
                    opened(false);
                    props.onAdded(added.value.title);
                  } else setProblem(added.error);
                }}
                validationErrors={refused()}
                class="flex flex-col gap-6"
              >
                <div class={modal.body() + " flex flex-col gap-4"}>
                  <TextField.component name="title" value={title()} onChange={(v: string) => setTitle(v)} isRequired={true} isInvalid={untitled()}>
                    <Label.component>Title</Label.component>
                    <Input.component placeholder="What is to be done" />
                    <FieldError.component>Give the task a title.</FieldError.component>
                  </TextField.component>
                  <TextField.component name="note" value={note()} onChange={(v: string) => setNote(v)}>
                    <Label.component>Note</Label.component>
                    <TextArea.component placeholder="A line more about it" rows="2" />
                    <FieldError.component>The note is too long.</FieldError.component>
                  </TextField.component>
                  <p class="text-sm text-danger empty:hidden" role="alert">
                    {problem()}
                  </p>
                </div>
                <footer class={modal.footer()}>
                  <Button.component variant="tertiary" onClick={() => opened(false)}>
                    Cancel
                  </Button.component>
                  <Button.component type="submit">Add</Button.component>
                </footer>
              </Form.component>
            </Dialog.Content>
          </div>
        </div>
      </Dialog.Portal>
    </Dialog.Root>
  );
}
