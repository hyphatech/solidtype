import * as Breadcrumbs from "@kobalte/core/breadcrumbs";

export function make() {
  return (
    <Breadcrumbs.Root>
      <ol>
        <li>
          <Breadcrumbs.Link href="#home">Home</Breadcrumbs.Link>
          <Breadcrumbs.Separator />
        </li>
        <li>
          <Breadcrumbs.Link href="#guides">Guides</Breadcrumbs.Link>
          <Breadcrumbs.Separator />
        </li>
        <li><Breadcrumbs.Link current>Install</Breadcrumbs.Link></li>
      </ol>
    </Breadcrumbs.Root>
  );
}
