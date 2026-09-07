Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD193B841F
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749402; cv=none; b=W63D+YD3FwPSo3TVtdJ4T+ouDNL/4NZFNuE2n1fsdYa6RL25r62qID6C/s4IfDPMjDWlOUE2Q2HEQPxkrUovWZNMDNTMIB/TPgDEA0f+ev2Rif0YF8ITplYtHMNR5u70Y8kwOiRJ4ZIA7+XQAsFsE8tngEuEYWyCVZwcD+rMz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749402; c=relaxed/simple;
	bh=LMAwEh2qhWvJIfV88WNhthEus6Q6reXWRV0IwfJMsWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CBPIQv9posR2R65fyRmn2eFiM+3rsbzDaxJ6u6Fd7q3OZKeMyWJs+FiowZ99GNgn/0I9tpciX574DCBE10zNqQ1X/9n8eEecQDguEXXWwYcxYgXZJq3yzI51GzTPioih2OcZ48Z4hC3+YhT+BGGDwLe4yE1etmIbTNqYWafVbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdmQBAz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdmQBAz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577791F00A3A;
	Mon,  7 Sep 2026 02:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788749400;
	bh=MQDOsoA2UxScmqfv0domxZDyjfPeCZYP1UQZdLGlH7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mdmQBAz/Jnrgnga9LMe2DiA1wPL/WHEN4+81/Kx8Bqa7g9S0niPeQsPJaRgNyF/SV
	 fyxy45IyzGWx0Y09rqMI2u1JBNErcL+O2aoWATAfnNRUwa2mVnGbEk4MzXVIXyGXYU
	 iiY+zC1pOjhIilRrYlyAD0/8uqJGBqqFa3c9oGobHkRArbInTlbjcTM9z8K9R0Zx/4
	 FCNtR19y7prXaBJQoc2cLv/ZXBU32ZY7uAD/3xf/AoBO9YxJihMilYeVFkpjkYbjeF
	 oZxA+Q33Pyph16msJgkhs0erdl5or0O8CRQ6IrIIEf1ay0N+cFBvks6Ep8JI7CiKwp
	 iLzzlIGl4K7Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] mfd: loongson-se: Fix miscellaneous issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260907023827.14905-3-zhaoqunqin@163.com>
References: <20260907023827.14905-1-zhaoqunqin@163.com>
 <20260907023827.14905-3-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 02:49:59 +0000
Message-Id: <20260907025000.577791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Read-modify-write operations on the SE_S2LINT_EN register are inco=
nsistently protected by two different spinlocks, causing a data race and lo=
st interrupt masks.
- [High] The loongson_se_stop cleanup handler uses an interruptible wait, a=
llowing pending signals to bypass hardware teardown and cause DMA use-after=
-free.
- [High] Re-initializing an actively monitored completion structure dynamic=
ally in `loongson_se_init_engine` causes a race condition with active IRQ h=
andlers.

Pre-existing issues:
- [High] The exported API `loongson_se_init_engine()` lacks bounds validati=
on on the caller-provided `id`, allowing array overruns and DMA buffer over=
laps.
- [Medium] The parent driver exposes bespoke accessors and driver-level cal=
lbacks to child drivers, directly violating MFD subsystem guidelines.
- [Medium] Driver-specific header file is inappropriately placed in the glo=
bal include/linux/mfd/ directory.
--

commit d7b07e09007f31031f54d602ea81c002547a5aa5
Author: Qunqin Zhao <zhaoqunqin@loongson.cn>
mfd: loongson-se: Fix miscellaneous issues

This patch addresses several issues discovered in the Loongson Security
Engine driver, including adding bounds checks, serializing command
submissions, handling EPROBE_DEFER, and setting up an explicit stop
cleanup handler.

Link: https://lore.kernel.org/all/20260618095949.GB1672911@google.com/ [1]

> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 7f552a8ee6a26..1d332c418bea7 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c
[ ... ]
> @@ -42,7 +44,7 @@ static int loongson_se_poll(struct loongson_se *se, u32=
 int_bit)
[ ... ]
> -	spin_unlock_irq(&se->dev_lock);
> +	/*
> +	 * Re-enable the interrupt that loongson_se_reinit_completion() masked.
> +	 * The hardware guarantees that once the interrupt is re-enabled, only
> +	 * interrupts for the command just issued can arrive, so a stale
> +	 * interrupt from a previously interrupted command can never complete
> +	 * this command's completion.
> +	 */
> +	writel(int_bit | readl(se->base + SE_S2LINT_EN), se->base + SE_S2LINT_E=
N);
> +
> +	spin_unlock(&se->poll_lock);

[Severity: High]
Does this introduce a data race on the SE_S2LINT_EN register?
This modifies the register under poll_lock, while the new
loongson_se_reinit_completion() function modifies the exact same register
under dev_lock. If two child drivers submit commands concurrently to
different engines, their read-modify-write cycles could interleave,
causing one thread to overwrite and erase the interrupt mask modifications
made by the other. This could lead to permanently stalled commands.

[ ... ]
> @@ -75,12 +108,16 @@ static int loongson_se_send_controller_cmd(struct lo=
ongson_se *se,
> =20
>  int loongson_se_send_engine_cmd(struct loongson_se_engine *engine)
>  {

[Severity: Medium]
This is a pre-existing issue, but does exporting this driver-level
callback directly violate MFD subsystem guidelines forbidding tight functio=
nal
coupling? The guidelines state sibling or child drivers should not make
direct function calls to each other bypassing standard kernel APIs.

> +	int err;
> +
> +	loongson_se_reinit_completion(engine->se, &engine->completion, BIT(engi=
ne->id));
[ ... ]
> @@ -93,7 +130,7 @@ struct loongson_se_engine *loongson_se_init_engine(str=
uct device *dev, int id)
>  {
>  	struct loongson_se *se =3D dev_get_drvdata(dev);

[Severity: Medium]
This is also a pre-existing issue, but does exporting this custom parent-ch=
ild
accessor violate the MFD subsystem guidelines? The guidelines state
that bespoke accessors or helper functions should not be written in the par=
ent
to pass state to child devices.

>  	struct loongson_se_engine *engine =3D &se->engines[id];

[Severity: High]
This is a pre-existing issue, but is it safe to use the unvalidated id
argument directly as an array index? If a caller passes an id greater
than or equal to SE_ENGINE_MAX, it would cause an out-of-bounds memory
access. Also, if id is 0, the assigned data buffer would completely overlap
with the command streams of all other engines.

> -	struct loongson_se_controller_cmd cmd;
> +	struct loongson_se_controller_cmd cmd =3D {0};
[ ... ]
> @@ -188,6 +226,17 @@ static const struct mfd_cell engines[] =3D {
>  	{ .name =3D "tpm_loongson" },
>  };
> =20
> +static void loongson_se_stop(void *data)
> +{
> +	struct loongson_se *se =3D data;
> +	struct loongson_se_controller_cmd cmd =3D {0};
> +
> +	cmd.command_id =3D SE_CMD_STOP;
> +	loongson_se_send_controller_cmd(se, &cmd);

[Severity: High]
Could this cleanup handler fail to stop the controller if a signal is pendi=
ng?
loongson_se_send_controller_cmd() waits for completion using an
interruptible wait. If a signal is pending (like the user hitting Ctrl-C
during probe failure or module unload), the wait instantly returns without
waiting for the hardware. Because loongson_se_stop() ignores this abort,
the devres core would immediately free the coherent DMA memory while the
hardware is potentially still active, causing a use-after-free.

> +
> +	writel(0, se->base + SE_S2LINT_EN);
> +}
[ ... ]
> @@ -195,19 +244,34 @@ static int loongson_se_probe(struct platform_device=
 *pdev)
>  	int nr_irq, irq, err, i;
>  	dma_addr_t paddr;
> =20
> -	se =3D devm_kmalloc(dev, sizeof(*se), GFP_KERNEL);
> +	se =3D devm_kzalloc(dev, sizeof(*se), GFP_KERNEL);
>  	if (!se)
>  		return -ENOMEM;
> =20
>  	dev_set_drvdata(dev, se);
>  	init_completion(&se->cmd_completion);
>  	spin_lock_init(&se->dev_lock);
> +	spin_lock_init(&se->poll_lock);
>  	mutex_init(&se->engine_init_lock);
> =20
> +	for (i =3D 0; i < SE_ENGINE_MAX; i++)
> +		init_completion(&se->engines[i].completion);
> +

[Severity: High]
Could this duplicate initialization conflict with the existing
init_completion() call inside loongson_se_init_engine()? Since hardware
interrupts are fully unmasked later in probe(), a spurious interrupt could
arrive concurrently while child drivers probe and call
loongson_se_init_engine(). If the IRQ handler calls complete() exactly
when the dynamic init_completion() resets the internal wait queue lock,
it could corrupt the spinlock and cause a kernel panic.

[ ... ]
> diff --git a/include/linux/mfd/loongson-se.h b/include/linux/mfd/loongson=
-se.h
> index 07afa0c2524d5..8237ccab7bf1e 100644
> --- a/include/linux/mfd/loongson-se.h
> +++ b/include/linux/mfd/loongson-se.h
> @@ -9,6 +9,7 @@
>  #define SE_SEND_CMD_REG_LEN		0x8

[Severity: Medium]
This is a pre-existing issue, but does placing this driver-specific header
file in the global include/linux/mfd/ directory violate MFD guidelines?
The guidelines state that header files only used by the parent and its
immediate children should be kept local to drivers/mfd/ to avoid global
namespace pollution.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907023827.1490=
5-1-zhaoqunqin@163.com?part=3D2
