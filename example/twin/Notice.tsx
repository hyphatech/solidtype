import * as Toast from "@kobalte/core/toast";

export function show(title: string, text: string) {
  Toast.toaster.show((props) => (
    <Toast.Root
      class="relative rounded-xl border border-stone-200 bg-white p-4 pr-10 shadow-lg dark:border-stone-700 dark:bg-stone-900"
      toastId={props.toastId}
    >
      <Toast.Title class="font-semibold">{title}</Toast.Title>
      <Toast.Description class="text-sm text-stone-600 dark:text-stone-300">{text}</Toast.Description>
      <Toast.CloseButton
        class="absolute right-2 top-2 grid h-6 w-6 place-items-center rounded-md text-stone-400 hover:bg-stone-100 dark:hover:bg-stone-800"
        aria-label="Dismiss"
      >
        ×
      </Toast.CloseButton>
    </Toast.Root>
  ));
}
