import * as NavigationMenu from "@kobalte/core/navigation-menu";

export function make() {
  return (
    <NavigationMenu.Root>
      <NavigationMenu.Menu>
        <NavigationMenu.Trigger>Learn</NavigationMenu.Trigger>
        <NavigationMenu.Portal>
          <NavigationMenu.Content>
            <NavigationMenu.Item href="/guide">Guide</NavigationMenu.Item>
            <NavigationMenu.Item href="/api">API</NavigationMenu.Item>
          </NavigationMenu.Content>
        </NavigationMenu.Portal>
      </NavigationMenu.Menu>
      <NavigationMenu.Menu>
        <NavigationMenu.Trigger>Community</NavigationMenu.Trigger>
        <NavigationMenu.Portal>
          <NavigationMenu.Content>
            <NavigationMenu.Item href="/forum">Forum</NavigationMenu.Item>
            <NavigationMenu.Item href="/chat">Chat</NavigationMenu.Item>
          </NavigationMenu.Content>
        </NavigationMenu.Portal>
      </NavigationMenu.Menu>
      <NavigationMenu.Viewport role="presentation" />
    </NavigationMenu.Root>
  );
}
