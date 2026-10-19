import * as Skeleton from "@kobalte/core/skeleton";

export function make() {
  return (
    <div>
      <Skeleton.Root height={40} radius={10}><p>Ada Lovelace</p></Skeleton.Root>
      <Skeleton.Root visible={false} animate={false} circle={true} height={24}>
        <p>AL</p>
      </Skeleton.Root>
    </div>
  );
}
