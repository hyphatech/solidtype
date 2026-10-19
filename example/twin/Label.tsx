export function make(props: { text: string }) {
  return <span class="label">{props.text}</span>;
}

export const component = make;
