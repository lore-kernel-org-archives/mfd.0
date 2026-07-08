Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80EF433BD0
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510329; cv=none; b=RXy4RHSQZ/kwKpc+6Nzk+QS6gc8src16b30a/r78kLDMP/Oq6XuuDrqQBwLb/S5+VoJsQ6u5gXNnjXapSjG8r1v62x4ePmxaEgPPwKKENW1boLZ9Tr2uZQTvbxVSmkHtSvf3I3l4aReMu3ds5DjAJOdbJcjNze8oImA7XPOxaco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510329; c=relaxed/simple;
	bh=r47PBin7jjvmv0PX2+UDWFeSb+24HSKiUyjEzKD9ZXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AjcaFsdGtqMZWF1w271ojDkzWS1dJoJnv6lBXpH3gLpoi9/tpJezim+pOwGe+u2ywbtdpzNoe1nyX7hTgDM8dkT1XQpNy+BG8k5EUJR9Ioo8KTYpkN0aHlOdskCLX+yCCzIMFkzaEHuZQ4tmYXiTcjhZ96nKeH6Md2lF4v9d13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyDosBdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyDosBdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E01C1F00A3A;
	Wed,  8 Jul 2026 11:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510327;
	bh=Iu5UvD198z8Nu6JENOkRhkj86stgAbZucz311wWHQJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IyDosBdYfiZk1XphhHwxNoIa5/EcADvTOsVAkegVHb7FEGzE5uUTgnfwyN7LcoQNf
	 qnKAlponNFek0Lnzs88RMESl4nBnnnN/fZY/X6QO177T0Ot0SOjhKxbRQLqxIH8opP
	 TR1xYmFNhBGfSQw8a+Vj3UAPCjvniG9bCLZ4iLk4jM4ukVAVzNb297wVeL6CbBGEvz
	 ipTeQhFL11AqftchtBaOoLfNBRnd0shUbhIVFoY3jvJGNWHazVQu4Nj2GLuH5ul01h
	 Sjs/g8gFeCFi7m8vQGg/seOHyJljDV8WE41agfUp086pQLJIkopqW6QVPUdlJKly12
	 cNY1CwnYly+Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/23] mfd: loongson-se: Drop unused assignment of
 acpi_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <52d02d74d8c7589731ee0f0805123cfbf2f992d3.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <52d02d74d8c7589731ee0f0805123cfbf2f992d3.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:32:06 +0000
Message-Id: <20260708113207.4E01C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

Pre-existing issues:
- [High] Uninitialized stack memory within `struct loongson_se_controller_c=
md` is written directly to the hardware's MMIO registers.
- [High] Missing validation of the ACPI `dmam_size` property can cause out-=
of-bounds DMA buffer usage and memory corruption.
- [High] Ignoring `devm_request_irq()` errors allows the probe to proceed w=
ithout IRQs, guaranteeing a future thread deadlock.
- [High] Missing `reinit_completion()` before issuing hardware commands wil=
l cause premature false-positive returns if a previous command was interrup=
ted.
- [High] Unhandled hardware interrupt bits can crash the kernel via an out-=
of-bounds array access in the interrupt handler.
- [High] Hardware interrupts are fully enabled before the IRQ handler is re=
gistered and before `se->engines` is initialized, which can trigger an IRQ =
storm or kernel panic.
- [High] Hardware interrupts are left enabled if the probe function fails o=
r upon module removal, potentially causing unhandled interrupt storms.
- [Medium] The driver implements bespoke accessors to share state with chil=
d devices, violating MFD subsystem guidelines.
- [Medium] Polling loop holds a spinlock with interrupts disabled for up to=
 10 milliseconds.
- [Medium] The return value of `dma_set_mask_and_coherent()` is ignored.
--

--- Patch [7]: [PATCH v2 07/23] mfd: loongson-se: Drop unused assignment of=
 acpi_device_id driver data ---
commit 55ba21633256767bd465fa88072d7b0a24283435
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: loongson-se: Drop unused assignment of acpi_device_id driver data

The driver explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this unused
assignment. This patch doesn't modify the compiled array, only its
representation in source form benefits.

> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 3902ba377d690..4c668e2d22412 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c
> @@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *=
pdev)
>  }
> =20
>  static const struct acpi_device_id loongson_se_acpi_match[] =3D {
> -	{ "LOON0011", 0 },
> +	{ "LOON0011" },
>  	{ }
>  };

While reviewing this patch, I noticed several pre-existing issues in this f=
ile.

drivers/mfd/loongson-se.c:loongson_se_init_engine() {
    ...
    struct loongson_se_engine *loongson_se_init_engine(struct device *dev, =
int id)
    ...
}

drivers/mfd/loongson-se.c:loongson_se_send_engine_cmd() {
    ...
    int loongson_se_send_engine_cmd(struct loongson_se_engine *engine)
    ...
}

[Severity: Medium]
This isn't a bug introduced by this patch, but does the driver implement
bespoke accessors to share state with child devices?

According to MFD subsystem guidelines, child drivers should access shared
resources directly through standard APIs instead of using custom exported
accessors.

drivers/mfd/loongson-se.c:loongson_se_init() {
    ...
	struct loongson_se_controller_cmd cmd;
	int err;

	cmd.command_id =3D SE_CMD_START;
	err =3D loongson_se_send_controller_cmd(se, &cmd);
    ...
}

drivers/mfd/loongson-se.c:loongson_se_send_controller_cmd() {
    ...
	for (i =3D 0; i < SE_SEND_CMD_REG_LEN; i++)
		writel(send_cmd[i], se->base + SE_SEND_CMD_REG + i * 4);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is uninitialized stack memory
leaked to the device's MMIO registers?

The cmd struct is declared on the stack, but only the command_id is set bef=
ore
the entire structure is copied to device registers via writel().

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
	if (device_property_read_u32(dev, "dmam_size", &se->dmam_size))
		return -ENODEV;
    ...
}

drivers/mfd/loongson-se.c:loongson_se_init_engine() {
    ...
	engine->command =3D se->dmam_base + id * (2 * SE_ENGINE_CMD_SIZE);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but can the missing validation of
the dmam_size property cause out-of-bounds DMA buffer usage?

The dmam_size is retrieved with no lower-bound validation. A small or
incorrect value could result in calculated engine command buffer offsets
exceeding the allocated DMA bounds.

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
		err =3D devm_request_irq(dev, irq, se_irq_handler, 0, "loongson-se", se);
		if (err)
			dev_err(dev, "failed to request IRQ: %d\n", irq);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does ignoring
devm_request_irq() errors allow the probe to proceed without IRQs,
guaranteeing a future thread deadlock?

If the IRQ request fails, the driver logs an error but continues initializa=
tion.
Later, loongson_se_init() unconditionally blocks on
wait_for_completion_interruptible(), which will wait indefinitely without an
IRQ handler to signal it.

drivers/mfd/loongson-se.c:loongson_se_send_controller_cmd() {
    ...
	return wait_for_completion_interruptible(&se->cmd_completion);
    ...
}

drivers/mfd/loongson-se.c:loongson_se_send_engine_cmd() {
    ...
	return wait_for_completion_interruptible(&engine->completion);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but are commands issued without
calling reinit_completion() beforehand?

If a previous command was interrupted by a signal, the internal completion
counter remains unconsumed, which could cause a subsequent command to return
a premature false-positive success.

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
	writel(SE_INT_ALL, se->base + SE_S2LINT_EN);
    ...
}

drivers/mfd/loongson-se.c:se_irq_handler() {
    ...
		id =3D __ffs(int_status);
		complete(&se->engines[id].completion);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but can unhandled hardware inter=
rupt
bits crash the kernel via an out-of-bounds array access?

By enabling all 32 interrupt bits with SE_INT_ALL, an interrupt for a bit >=
=3D 16
could result in an id >=3D 16, which would exceed the fixed-size engines ar=
ray.

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
	writel(SE_INT_ALL, se->base + SE_S2LINT_EN);

	nr_irq =3D platform_irq_count(pdev);
    ...
}

drivers/mfd/loongson-se.c:se_irq_handler() {
    ...
		complete(&se->engines[id].completion);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but are hardware interrupts fully
enabled before the IRQ handler is registered and engine completions are
initialized?

If an early interrupt fires upon being enabled, the handler will dereferenc=
e an
uninitialized completion struct, which could cause a kernel panic when lock=
ed.

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
	err =3D loongson_se_init(se, paddr, se->dmam_size);
	if (err)
		return err;
    ...
}

drivers/mfd/loongson-se.c:loongson_se_driver {
    ...
static struct platform_driver loongson_se_driver =3D {
	.probe   =3D loongson_se_probe,
	.driver  =3D {
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but are hardware interrupts left
enabled if the probe function fails or upon module removal?

The probe error paths exit directly without masking the previously enabled
hardware interrupts, and the platform driver lacks a .remove callback entir=
ely,
which could lead to unhandled interrupt storms.

drivers/mfd/loongson-se.c:loongson_se_poll() {
    ...
	err =3D readl_relaxed_poll_timeout_atomic(se->base + SE_L2SINT_STAT, statu=
s,
						!(status & int_bit),
						1, LOONGSON_ENGINE_CMD_TIMEOUT_US);
    ...
}

[Severity: Medium]
This isn't a bug introduced by this patch, but does the polling loop hold a
spinlock with interrupts disabled for up to 10 milliseconds?

Polling atomically for 10ms violates kernel guidelines for latency and can
starve other critical tasks.

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
    ...
}

[Severity: Medium]
This isn't a bug introduced by this patch, but is the return value of
dma_set_mask_and_coherent() ignored?

If the platform does not support the requested 64-bit mask, the driver will
proceed with allocation assuming success, which could lead to DMA failures =
or
IOMMU faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D7
