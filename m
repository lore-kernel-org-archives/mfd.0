Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639C370AF1;
	Mon,  3 Aug 2026 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751310; cv=none; b=MRMbpi7dSny75rqSsfj7HuR3ugb5wJmg6Y+AGBbv1/COvpwg0IIPFy9AkX90Rq0NFGYKPNTpWT7YcoU46H/W3MoFWOCbVPYtx3gfxgsy5dicaW+wBrR6LdgWN00oZqgZt5apB29CT6qSZcYfoaRi/TVstzu0g7gL1S1Y4PPLncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751310; c=relaxed/simple;
	bh=mcNzft7bcbBc1akRdnGWceP/TeNNQdDHixtu6IGF44A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lISKUwrIh4FS0SOicE8SJLDbRYm6o2fO4gaHeZ/QfcALSQnsU2JazWzZBdfcsOeJsDqvHqN2Z/JgX5DntM+gKKGAT7aIBDM/aSTrl+bj7Wh0KTafHNyormgBTS4lkxDnHkjZyGB78MSIKnF0sQ9M9gN3aanSr5daKO3jH+UsjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRk8oIbR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRk8oIbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AA61F00A3A;
	Mon,  3 Aug 2026 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751308;
	bh=k+OkAykj20X3kIjKQ0/5iTa5ABHujUvxKuJESHY6ve8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRk8oIbRmRnzigdMEjiU0xNud5ouhqUqtoY9w8YAz+pjCgZ3Zf1G0UQDtTXCdHtlB
	 kZS50ZkFUBoxUyKirDJ7EGSac6Fp2ebs7fEYsDlm/u0Ugg+B/GqMCGmUIYU2+wszYC
	 wqPypHFtIZG3ISGKc9ynTs4smqD5d8Yof0ZrtLAJWrgmexx0i4piuBvA2EYfHbALEW
	 NQS1W/kFpZYNe3KQSYm9Lwb8Iy6Fl1m1ktqvzUQroHM5MuA7qkI5YRvZ+XcXnYpB8v
	 4pQjFHJLTfWyqNpeqQnBBj1q4rFUDW2w6lLZEAEiLcR5OjHD5dZQsqwp7XUhiRWaw6
	 VQytzO7CCntEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 03/12] firmware: psci: Introduce command-based
 resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-3-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-3-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:01:47 +0000
Message-Id: <20260803100148.79AA61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Custom PSCI reset commands are completely ignored on standard norm=
al reboots due to an incorrect NULL check on the restart command string (`d=
ata`).
- [High] The 64-bit vendor reset `cookie` is silently truncated to 32 bits =
on 32-bit ARM architectures, violating the PSCI SMC32 calling convention.
- [Medium] The `psci_set_reset_cmd` API cannot be used by modular drivers b=
ecause it is not exported.
- [Low] `psci_set_reset_cmd()` does not validate that a non-zero `reset_typ=
e` has the vendor-specific bit set.
--

--- Patch [3]: [PATCH v24 03/12] firmware: psci: Introduce command-based re=
sets ---
commit f75a0ef9e572ce4de306eab6e925457653c70d6f
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

firmware: psci: Introduce command-based resets

This commit introduces a mechanism to support command-based resets via
PSCI, allowing reboot-mode drivers to specify a reset_type and cookie.
It falls back to the normal reboot_mode-based reset path if the command
is unsupported or a panic occurs.

> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
[ ... ]
> @@ -80,6 +92,61 @@ static u32 psci_cpu_suspend_feature;
> +/**
> + * psci_set_reset_cmd() - Configure the PSCI reset command
> + * @reset_type: SYSTEM_RESET2 reset type, or 0 for a standard reset
> + * @cookie: Vendor-defined SYSTEM_RESET2 cookie, or a value from
> + *	    enum psci_standard_resets when @reset_type is 0
> + *
> + * For vendor-specific SYSTEM_RESET2 resets, @reset_type and @cookie
> + * must contain platform-defined values.
> + *
> + * For standard resets, @reset_type must be 0 and @cookie must be a
> + * value from enum psci_standard_resets.
> + *
> + * The reset command may be configured only once per boot cycle.
> + */
> +int psci_set_reset_cmd(u32 reset_type, u64 cookie)
> +{
> +	if (!reset_type && !cookie)
> +		return -EINVAL;

[Severity: Low]
Does this function need to validate that a non-zero reset_type has the
vendor-specific bit (PSCI_1_1_RESET_TYPE_VENDOR_START) set?=20

If a caller erroneously passes a reset_type that is greater than 0 but
lacks this bit, it is stored successfully but will be silently ignored
during reboot in psci_handle_reset_cmd(). Rejecting it here with -EINVAL
might prevent silent runtime failures.

> +
> +	scoped_guard(mutex, &reset_cmd_mutex) {
> +		if (reset_cmd)
> +			return -EBUSY;
> +
> +		reset_cmd_data.reset_type =3D reset_type;
> +		reset_cmd_data.cookie =3D cookie;
> +		/*
> +		 * Publish the command only after both fields are fully initialized.
> +		 * Readers run from the atomic restart notifier path and must not bloc=
k.
> +		 */
> +		smp_store_release(&reset_cmd, &reset_cmd_data);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Is this missing an EXPORT_SYMBOL_GPL?=20

Reboot-mode drivers are often configured as loadable kernel modules (e.g.,
CONFIG_REBOOT_MODE=3Dm), and without an export, they will fail to link agai=
nst
this new API.

[ ... ]
> +static void psci_handle_reset_cmd(const struct psci_system_reset_cmd *cm=
d)
> +{
> +	u32 psci_sys_reset_fn;
> +
> +	/* PSCI_1_1_RESET_TYPE_VENDOR_START identifies vendor reset types. */
> +	if ((cmd->reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
> +	    psci_system_reset2_supported) {
> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +			       cmd->reset_type, cmd->cookie, 0);

[Severity: High]
Will this silently truncate the 64-bit cmd->cookie on 32-bit ARM
architectures?

Because invoke_psci_fn() takes arguments of type unsigned long, the C
compiler will cast the u64 cookie to 32 bits. Under the SMC32 calling
convention for SYSTEM_RESET2, the secure monitor expects the 64-bit cookie
passed across two 32-bit registers (r2 and r3).=20

Here, it seems r3 will receive 0 because it is passed as the fourth argumen=
t,
corrupting the hardware communication for vendor-specific resets that rely =
on
the upper 32 bits.

> +	} else {
> +		/* Retrieve the psci reset function from reset_cmd */
> +		psci_sys_reset_fn =3D psci_get_sys_reset_fn(cmd);
> +		if (!cmd->reset_type && psci_sys_reset_fn)
> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
> +	}
> +}
[ ... ]
> +static int psci_sys_reset(struct notifier_block *nb, unsigned long actio=
n,
> +			  void *data)
> +{
> +	const struct psci_system_reset_cmd *cmd;
> +
> +	/* The function psci_handle_reboot_mode follows reboot_mode based
> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
> +	 *
> +	 * The reset_cmd is configured at the reboot_notifier phase.
> +	 * If panic() or emergency_restart() occurs between the reboot_notifier
> +	 * and this final reset, skip command-based reset and let reboot_mode d=
rive
> +	 * the reset flow.
> +	 *
> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM=
_RESET
> +	 * calls to reset the device. If it returns, either the reset failed, o=
r the
> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
> +	 */
> +	cmd =3D smp_load_acquire(&reset_cmd);
> +	if (data && cmd && !panic_in_progress())
> +		psci_handle_reset_cmd(cmd);

[Severity: High]
Are custom reset commands completely ignored on standard normal reboots
due to the "data &&" check?

A standard user-initiated reboot (e.g., executing the reboot command without
arguments) invokes sys_reboot(LINUX_REBOOT_CMD_RESTART), which ultimately
calls kernel_restart(NULL). This passes NULL down the notifier chain, resul=
ting
in data =3D=3D NULL in psci_sys_reset().

Because of this check, the custom command path appears to be skipped entire=
ly,
forcing a fallback to the default behavior and defeating the purpose of
setting a custom command for standard reboots.

> +
> +	psci_handle_reboot_mode();
> =20
>  	return NOTIFY_DONE;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D3
