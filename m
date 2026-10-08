Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8037DAA9
	for <mfd@lists.linux.dev>; Thu,  8 Oct 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445522; cv=none; b=Lv/sw1X8Ue/37aql/dLSF4KVQi0G5ewRqTKYIkl25JsT2k/QcwLZK+YxN/Z8vWY6MvJINMU81HFADgiPB3IEdW8AptCu3kiq/QJvzl++NGw2wNKhaBhKu6RfIFBBCApAVJ75Yd/uvJAq5SgONK8tbKKsFMSV13RG2+rrm+HN1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445522; c=relaxed/simple;
	bh=vBAwa6db1IDs6p6WtYNeaWN7RqYwqn3FUTym+bNVaQU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LncUGcbiE1diLkROzmcwGZS1qmCm3n7QWjZvbA2GVN/SikUu758L32ziMNc5qVnv39oV57P5uWgCMZRzToSyCp7GfMiSYisNUizgBqrEZyu1Rgh66eIAwUkTHcvwF8HMj6VzuGHKGGSGgzZsHOdtAvmERd0UFUmCxGxa07W9PB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW319cL8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW319cL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129741F000FF;
	Thu,  8 Oct 2026 07:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445521;
	bh=1wnK3XKGOOIQ0j0Ele9V/CW8TGWWjHUGEJkL2ODuXR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GW319cL80EN1Jiae+ChvV65PsgC0JBea2+1WJN7pW411eKBPVuKFJxMICisamdM9Z
	 YSwHqYebqdMuR1DxCU7+hlbSBbme0QlUO/Qkkn21vNKAjKRP2dN1CcEbQKjoyvtB5l
	 8dOH30ynKW5m8/rUzFu4Aqoo5bW0/7daw60YQ2EYwpJ4qNPXqJrWJ8bHasnsugKftz
	 5/MlmBzqqXGTEUHoh1hMunaawLDxul64yStUc+dP21pMJ9RcLXW600YmrqaBq4tkL3
	 z/x4/cLmOsB0LH1+XdgbftP1F9FbA0kOfJXxjyx5ZBqqBZ/9zMD6IXVpNVK1oMn0mX
	 GGsFdnBYXi+0w==
Message-ID: <sashiko-outbox-163780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] mfd: loongson-se: Fix miscellaneous issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261008073151.15808-3-zhaoqunqin@163.com>
References: <20261008073151.15808-1-zhaoqunqin@163.com>
 <20261008073151.15808-3-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:45:20 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mfd: loongson-se: hardware wedging due to interruptible wait in en=
gine commands
- [Medium] mfd: loongson-se: Bespoke parent-child accessors and inter-drive=
r callbacks violate MFD API
--

commit 6e6ed05719359ac0c5fefbfd5ea2f85ac87b10f6
Author: Qunqin Zhao <zhaoqunqin@loongson.cn>
mfd: loongson-se: Fix miscellaneous issues

This commit addresses multiple historical driver issues discovered by the
Sashiko Automation system within the loongson_se_probe() initialization flow
and the driver's interrupt service routines. It adds bounds checks,
initializes completion structures, and handles errors more robustly.

Link: https://lore.kernel.org/all/20260618095949.GB1672911@google.com/ [1]

> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 969378518065b..2fb5da85b2479 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c
[ ... ]
> @@ -70,18 +101,31 @@ static int loongson_se_send_controller_cmd(struct lo=
ongson_se *se,
>  	if (err)
>  		return err;
> =20
> -	return wait_for_completion_interruptible(&se->cmd_completion);
> +	/*
> +	 * Wait for the controller to complete the command.  Use a bounded
> +	 * non-interruptible wait: a pending signal must not leave the
> +	 * controller running while its DMA buffers are being torn down.
> +	 * One second is far more than any controller command should take,
> +	 * while still bounding the wait if the hardware wedges.
> +	 */
> +	if (!wait_for_completion_timeout(&se->cmd_completion, HZ))
> +		return -ETIMEDOUT;
> +
> +	return 0;
>  }
> =20
>  int loongson_se_send_engine_cmd(struct loongson_se_engine *engine)
>  {
> +	int err;
> +
> +	loongson_se_reinit_completion(engine->se, &engine->completion, BIT(engi=
ne->id));
> +

[Severity: Medium]
This might not be a direct bug, but does exporting this driver-level callba=
ck
violate the MFD subsystem API guidelines?

The MFD architectural guidelines specify that sibling or parent/child drive=
rs
should not use inter-driver callbacks. Instead of providing direct callback=
s,
child drivers should retrieve parent data using standard APIs and interact
via standard subsystems like regmap.

Could this be refactored to align with the standard subsystem APIs rather
than continuing to use this architectural pattern?

[Severity: High]
This patch successfully fixes a hardware desynchronization flaw for
controller commands above by switching to wait_for_completion_timeout(),
but the engine command wait in loongson_se_send_engine_cmd() is left as
wait_for_completion_interruptible().

If wait_for_completion_interruptible() is interrupted by a signal, it retur=
ns
-ERESTARTSYS without stopping the hardware engine, and the hardware continu=
es
performing DMA operations.

Could this cause a race condition where an unprivileged user-space process
sending a TPM command receives a signal (e.g., SIGINT), aborting the wait?
When the TPM core releases its mutex, the application could immediately iss=
ue
a new command:

drivers/char/tpm/tpm_loongson.c:tpm_loongson_send() {
    ...
    cmd->data_len =3D count;
    memcpy(tpm_engine->data_buffer, buf, count);

    return loongson_se_send_engine_cmd(tpm_engine);
}

This would overwrite engine->data_buffer and engine->command while the
hardware is still processing the previous request.

Can this easily triggerable path lead to DMA stream corruption and hardware
wedging? Should loongson_se_send_engine_cmd() also use a bounded
non-interruptible wait?

>  	/*
>  	 * After engine initialization, the controller already knows
>  	 * where to obtain engine commands from. Now all we need to
>  	 * do is notify the controller that the engine needs to be started.
>  	 */
> -	int err =3D loongson_se_poll(engine->se, BIT(engine->id));
> -
> +	err =3D loongson_se_poll(engine->se, BIT(engine->id));
>  	if (err)
>  		return err;
> =20
> @@ -92,12 +136,17 @@ EXPORT_SYMBOL_GPL(loongson_se_send_engine_cmd);
>  struct loongson_se_engine *loongson_se_init_engine(struct device *dev, i=
nt id)
>  {
>  	struct loongson_se *se =3D dev_get_drvdata(dev);
> -	struct loongson_se_engine *engine =3D &se->engines[id];
> -	struct loongson_se_controller_cmd cmd;
> +	struct loongson_se_engine *engine;
> +	struct loongson_se_controller_cmd cmd =3D {0};

[Severity: Medium]
Does the use of this bespoke accessor function also conflict with the MFD A=
PI
guidelines?

The MFD subsystem architectural guidelines prohibit writing bespoke accesso=
rs
or helper functions in the parent MFD driver to pass state to child devices.
Child drivers should retrieve parent data directly using standard APIs like
dev_get_drvdata(pdev->dev.parent) and initialize their own resources.

Could this be refactored so child devices directly handle their own
initialization instead of relying on the parent to export this custom helpe=
r?

> +
> +	/* Engine 0 does not exist and its data buffer is reused for commands */
> +	if (id <=3D 0 || id >=3D SE_ENGINE_MAX)
> +		return NULL;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008073151.1580=
8-1-zhaoqunqin@163.com?part=3D2
