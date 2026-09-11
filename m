Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1546C4A9
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118235; cv=none; b=tXy65XW1+MBxi7hYAkU/WucgJ/IcmIJIuNZFgqpyh8iFvv1fX33DdsGJvNiihpzCumaqvUkrovtdiMwExKpr5ZfiLqpgwuENyhb9685rglZePHNuc1N/0T6zVBFtAchoScMNCJCM8DM5ONJ09fmrj8X28Ieow5RWAWevLZXSqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118235; c=relaxed/simple;
	bh=r15gZ9Gt0aH2vdfUMgjniPNiZ1ndlKf2/5LP/GvywkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nPtNNGYFEp9LEFQCWdC4c+vI6y4myGqFyh1jEDr0Sx625YnULnrcqNbUdfIzeOSc+3J02VK4ehaCYmkrhBXLQgU+S4Bd5Xo9NynezuUaECfJtmE7m5yXKNBV0HWgsI+eIaSgY1E3hQHJTejCCdKXnrT2bgIXLYa0ZewgIfTyY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dS3t3Ig0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dS3t3Ig0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466681F0089B;
	Fri, 11 Sep 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789118233;
	bh=RPRGyVBKp2dSO87GYkhtG0vm1w62N6WfEzR0qVFO/Tg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dS3t3Ig092bDMyhR/fECuby151vZ8evrG1Sw1GEYFeKOjM5hwSKei8SJIR05qb3pc
	 jmVeek0Jx6pHNlsMKvZzw4icbxn3R1wyVGDCn+0cvs+x+sZFtv0WFYuRyKDLHwGI49
	 M4uLGultopWr4r1TFgvNm4BTR4eNAZV0ZyuZjwIw9K98S6NB6owFCslYYOQiwHwzSQ
	 7sLdhehSWet4HqK0K4iPfuEGGofrl5qaKPdhe5V4T4kcJOjM1G496FcuKVLc2FQlej
	 jIH1bp8TMwW7urUQ9VVJdyzf7xtlUDDY3M/HN6+A8C9RRNaDXUupCgoNatOCcH+lYg
	 wJTeB/bI3LUow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] mfd: loongson-se: Fix miscellaneous issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911090256.7834-3-zhaoqunqin@163.com>
References: <20260911090256.7834-1-zhaoqunqin@163.com>
 <20260911090256.7834-3-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:17:12 +0000
Message-Id: <20260911091713.466681F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware Synchronization / Data Corruption due to interruptible wa=
it in engine command
--

commit 98359622515836b98cbd81f0e2b7ab6d00d62ba5
Author: Qunqin Zhao <zhaoqunqin@loongson.cn>
mfd: loongson-se: Fix miscellaneous issues

This commit addresses several historical driver issues discovered within the
loongson_se_probe() initialization flow and interrupt service routines. It
adds bounds checking, properly handles engine 0, improves completion=20
initialization, fixes error handling, and introduces bounded non-interrupti=
ble
waits for controller commands to avoid races during DMA teardown.

Link: https://lore.kernel.org/all/20260618095949.GB1672911@google.com/ [1]

> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 7f552a8ee6a26..18075d4fa0845 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c
[ ... ]
> @@ -70,17 +106,31 @@ static int loongson_se_send_controller_cmd(struct lo=
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
>  	/*
>  	 * After engine initialization, the controller already knows
>  	 * where to obtain engine commands from. Now all we need to
>  	 * do is notify the controller that the engine needs to be started.
>  	 */
> -	int err =3D loongson_se_poll(engine->se, BIT(engine->id));
> +	err =3D loongson_se_poll(engine->se, BIT(engine->id));
> =20
>  	if (err)
>  		return err;

[Severity: High]
This is a pre-existing issue, but does loongson_se_send_engine_cmd() still
suffer from the same interruptible wait flaw being fixed in
loongson_se_send_controller_cmd() above?

Just below this hunk, loongson_se_send_engine_cmd() calls
wait_for_completion_interruptible(&engine->completion).

If a user-space process issues a command via a child driver and receives a
signal, this wait allows the function to return immediately, while the
hardware engine continues its DMA operations in the background.

If the process immediately re-issues a command, could it overwrite the shar=
ed
DMA command buffer while the hardware is still reading/writing it, resulting
in data corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911090256.7834=
-1-zhaoqunqin@163.com?part=3D2
