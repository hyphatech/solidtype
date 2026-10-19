import * as Tabs from "@kobalte/core/tabs";

export function make() {
  return (
    <Tabs.Root defaultValue="profile">
      <Tabs.List aria-label="Settings">
        <Tabs.Trigger value="profile">Profile</Tabs.Trigger>
        <Tabs.Trigger value="account">Account</Tabs.Trigger>
        <Tabs.Trigger value="billing">Billing</Tabs.Trigger>
      </Tabs.List>
      <Tabs.Content value="profile">Your name and photo.</Tabs.Content>
      <Tabs.Content value="account">Your email and password.</Tabs.Content>
      <Tabs.Content value="billing">Your plan and invoices.</Tabs.Content>
    </Tabs.Root>
  );
}
