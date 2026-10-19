import * as FileField from "@kobalte/core/file-field";
import { createSignal } from "solid-js";

export function make() {
  const [report, setReport] = createSignal("Nothing chosen");
  return (
    <FileField.Root
      multiple={true}
      maxFiles={5}
      maxFileSize={100}
      onFileAccept={(files) => setReport(`Accepted ${files.length}`)}
      onFileReject={(rejections) => setReport(`Rejected ${rejections.length}`)}>
      <FileField.Label>Attachments</FileField.Label>
      <FileField.Dropzone>Drop files here</FileField.Dropzone>
      <FileField.Trigger>Choose files</FileField.Trigger>
      <FileField.HiddenInput />
      <FileField.ItemList>
        {(file) => (
          <FileField.Item>
            <FileField.ItemPreview type="image/*">An image</FileField.ItemPreview>
            <FileField.ItemName />
            <FileField.ItemSize />
            <FileField.ItemDeleteTrigger aria-label={"Remove " + file.name}>
              Remove
            </FileField.ItemDeleteTrigger>
          </FileField.Item>
        )}
      </FileField.ItemList>
      <FileField.Description>{report()}</FileField.Description>
    </FileField.Root>
  );
}
