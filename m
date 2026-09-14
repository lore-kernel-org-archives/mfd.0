Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBBA4A207C;
	Mon, 14 Sep 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398843; cv=none; b=cW8s+0VpdwGP6rcNJ605AB/JTZXkSjHGsMeVTdWw//6M59KjCvDLyl9qKLIMGUE24DCYSt8vxhs7JDMzHtk3SbYIsLQT0elwba9TSEKzXBWVCMcskYu4qrWIjtQdfOtqCOZPJlSvfsLg9AocotAA2qhgakvD2t1qk33IWJmMOHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398843; c=relaxed/simple;
	bh=9PCtYsfyINPrqIAeZ3YJVmxswREi/R6PK8RdwChxBEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VnrmVBCtiC3kZV9H3yjkDjuZKU9BjRdgBPWrrfJbWBgovu9TSWDNQqqNlxB1XXS3//TX2uSKJiek9fCOCkokDJbSNxB3v/K7AdchJdDkK4os2RDg6KaRb4WoCdRAkuy7tE1An5sSCRAgKOtCJlL/R7Hel15w0S2cpLQ7QInjVXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XH/0lZhy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XH/0lZhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99051F0089A;
	Mon, 14 Sep 2026 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398841;
	bh=/2wfuAjpA8bOxBdQekqLNojbgHyHVkJc/4RDbU/+LZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XH/0lZhySqqb6owzrw0HkOk1l+OteTmcwNzmHtx+TTULhZpSocGpomnvXZHYiwBAr
	 YfgrKAbCtBPRXy1Bg9scr/sDOva1htmBbsXh3E3tMch26w/l8sv1khwPsNr1kQwTR+
	 MlBVAS+6dWZqe9UpqY5c8XK7cNBTZeHgzRjVge3ZUTjT4Lq32LkXI8Axj7hB/U1cp7
	 sILIVpF6DPgu+5uF4rEFabQsHPLWofKyw/w6Is1dYNcE5B1HYl+6rA3tgSV7wqMz8v
	 HaIGv9rntlxWWqTsszj8GZ9gqXeSV7BO4aMWKEeqsrpj0AVcbkPFcDcsHiiiEQAqCn
	 iV0hY/G2bHxxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 03/10] firmware: psci: Introduce command-based
 resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:14:00 +0000
Message-Id: <20260914151400.D99051F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The restart handler `psci_sys_reset()` unintentionally skips confi=
gured reset commands for standard reboots due to checking if `data` is non-=
NULL.
--

commit 15791809d0deec27e24e64483b3317dacb5842a5
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

firmware: psci: Introduce command-based resets

This commit introduces a command-based reset mechanism allowing reboot-mode
drivers to specify custom PSCI reset commands like vendor-specific
SYSTEM_RESET2. It defaults to the existing reboot_mode flow unless a valid
reset command is configured.

> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb23a3..d489ba5d147ce 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c

[ ... ]

> @@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb,=
 unsigned long action,

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
Will this check unintentionally skip custom reset commands during a standard
reboot?

When a standard userspace reboot is triggered via the reboot syscall with
LINUX_REBOOT_CMD_RESTART, the reboot sequence ultimately calls
kernel_restart(NULL).=20

This propagates down to the atomic restart notifier chain in
do_kernel_restart(NULL), which passes a NULL command pointer to the notifier
handlers.

In psci_sys_reset(), the data parameter receives this NULL pointer. Because
of the check for a non-NULL data variable, the condition evaluates to false,
causing the handler to skip psci_handle_reset_cmd(). It then incorrectly
falls back to psci_handle_reboot_mode(), even if a valid command was
successfully configured by a reboot-mode driver.

Is the data check acting contrary to the commit message's goal of ignoring
reset commands during panic and emergency_restart?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D3
