Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A5374185;
	Mon,  3 Aug 2026 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751879; cv=none; b=ttU9k5a0SM7QIOoRDNIb+c5XOgrokMXK85pBMz8V5kyfdRVZxpkCcEKM4uTDKkYj/xzr6KrG8YCC4KMKIkywoI1b7ZW3qUjepEca7KVlLtRX/2AsCgSKgwEm3rZ/wO0mLvb5d6ZCIJqoLrWoHSSZnV5t8hghfUXc6PygxM22f14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751879; c=relaxed/simple;
	bh=dw8dH4yijzixq+RytGJswjmq0RsXrZZspOItMh/wZ0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Au+icAye4+SoqtybuUg7stb7nkM3PFDL7vim+wcxbPaauBG6fSDwDHUx9YCUuXZiYj57RmB28ObRLCNM8b5F8gHPGNo0RrTP1LhzOA44FlE4h3/WX3DnlUInILwj0sPob4ULC94IeW5x0/XuiMrUEsI2WT+xNCwh3lKmWNgXrTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxzgj072; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxzgj072"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91CF1F0155B;
	Mon,  3 Aug 2026 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751878;
	bh=wyTrsm81Tla6EQY6I7mmranuVrWiceXLiZqjPvPFE1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxzgj072RgxUGE9yBonAzNdLeSVP0BCiVLZcxOthco/uByfxNa9K31JLnqY4fEpQg
	 1AdnNdX9ophjPnLFH2xSj7XnJ9TlGr4/MJmHhZmlUildp9Fs0PLYme1BJc/GTLWh59
	 hTzpJy/v57TTkr4q5Y7BtDvCmJV8eVqFd5gQxhHREt5DyQt/kYtnjDiyH2zr9AYlDw
	 rXGKrrzkCIBNQO+4oxS8NB/zeqh0XUrUjzNywdhXixb3mp7QYfqgtGoW14uyf8Kv6q
	 MK2gnFFd4L5YyA5LTj9hsJ89gMho1SQsd45tpzTtNzT3cDtHIYQ1wdJXrCHnYTYQDs
	 hh7QtrtWT7TUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:11:17 +0000
Message-Id: <20260803101117.C91CF1F0155B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `psci-reboot-mode` driver is completely unreachable and non-fu=
nctional because it is never instantiated.
- [High] Standard 'normal' reboot mode commands are entirely ignored by PSC=
I due to an incorrect `data` check in the restart handler.
--

--- Patch [6]: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver =
---
commit 90394d93558537c03c13e84cb541a725b02ad7e4
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: power: reset: Add psci-reboot-mode driver

This commit adds a psci-reboot-mode driver to handle predefined and
vendor-specific PSCI resets. It registers the driver with the reboot-mode
framework to interface these resets to userspace. When userspace initiates a
supported command, the reset arguments are passed to the PSCI driver to
enable a command-based reset.

> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset=
/psci-reboot-mode.c
> new file mode 100644
> index 0000000000000..2f960fda8229f
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
[ ... ]
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
> +				  const u32 *magic, u32 count)
> +{
> +	(void)reboot;
> +
> +	if (count < 1 || count > 3)
> +		return -EINVAL;
> +
> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, =
count));

[Severity: High]
Does this work for standard "normal" reboots?

When a standard reboot is triggered without a specific command string, the
reboot_mode framework translates the NULL command to "normal" mode and calls
this write function to configure the reset command.

However, in drivers/firmware/psci/psci.c, psci_sys_reset() skips applying
the command because it checks for a non-NULL data argument:

drivers/firmware/psci/psci.c:psci_sys_reset() {
	...
	cmd =3D smp_load_acquire(&reset_cmd);
	if (data && cmd && !panic_in_progress())
		psci_handle_reset_cmd(cmd);

	psci_handle_reboot_mode();
	...
}

Will this cause standard reboots mapped to vendor-specific commands to be
silently ignored?

> +}
[ ... ]
> +static struct platform_driver psci_reboot_mode_driver =3D {
> +	.probe  =3D psci_reboot_mode_probe,
> +	.driver =3D {
> +		.name	=3D "psci-reboot-mode",
> +	},
> +};

[Severity: High]
Is this driver ever instantiated?

It appears to be missing an .of_match_table in the driver structure.

Additionally, looking at drivers/mfd/psci-mfd.c, psci-reboot-mode is not
included in the psci_cells array:

drivers/mfd/psci-mfd.c:psci_cells[] =3D {
	{
		.name =3D "psci-cpuidle-domain",
	},
};

Without an OF match table and being omitted from the MFD cells, how does th=
is
driver get probed to parse the vendor-specific reset modes from the device
tree?

> +module_platform_driver(psci_reboot_mode_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D6
