import * as Pagination from "@kobalte/core/pagination";

export function make() {
  return (
    <Pagination.Root
      aria-label="Pages"
      count={10}
      itemComponent={(props) => (
        <Pagination.Item page={props.page}>{props.page}</Pagination.Item>
      )}
      ellipsisComponent={() => <Pagination.Ellipsis>…</Pagination.Ellipsis>}>
      <Pagination.Previous>Previous</Pagination.Previous>
      <Pagination.Items />
      <Pagination.Next>Next</Pagination.Next>
    </Pagination.Root>
  );
}
