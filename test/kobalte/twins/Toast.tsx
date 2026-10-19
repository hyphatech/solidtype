import * as Toast from "@kobalte/core/toast";

function show() {
  Toast.toaster.show((props) => (
    <Toast.Root toastId={props.toastId}>
      <Toast.Title>Saved</Toast.Title>
      <Toast.Description>The draft is safe.</Toast.Description>
      <Toast.CloseButton>x</Toast.CloseButton>
    </Toast.Root>
  ));
}

export function make() {
  return (
    <div>
      <button type="button" onClick={() => show()}>Save</button>
      <Toast.Region><Toast.List /></Toast.Region>
    </div>
  );
}
