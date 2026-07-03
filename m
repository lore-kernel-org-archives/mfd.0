Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D13955F7
	for <mfd@lists.linux.dev>; Fri,  3 Jul 2026 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077196; cv=none; b=uYpKO2w2SUsH8xbgvpI6a4EuA5JncvfA7chjKneYOB5fFMgGuRrxVE9sgEx6yUS+zAxJi8fMaU7O4govJCwC+AMLjb7DnEoHWh46ie5hsnwSiuMfbCC5LChroRbveHX0P/831vFPltrOEtD3Tf1TX0jK9Zo0B463krJmnJXeoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077196; c=relaxed/simple;
	bh=m6dHfqQpc1w95iRM8SSJwJKbuzI3D6fuk9KQHkJOFao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FJvKhikalmSQ9lv+4q97jxvxkgwNgVSERDJa+fvs6clvB5a3It7FLeKPd8bwvw2V/OFkiwpISj4kJoGul6CMX+Dg4w6XHFUSu2vBF0xBY/MbWAkIbBfas5s4qHqNbm/+qOY/BMmy/NBIYEiE6hZAa8FXpmMWyTxywYb4qq65czI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSCOu3Ja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSCOu3Ja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC361F000E9;
	Fri,  3 Jul 2026 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077195;
	bh=1A7VLEj7t8sQnNhwHKqgKV3KFYEFB6/J8oYJ7beqHcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XSCOu3Ja1hEgVp/KextYB+cZkxCju2n0DAer7zEQpHLlnChJfAK6desmbMLBy8V0T
	 pZcvw4Tux/2A6XUQklmj3DeT/X0sC7z3sdnfl0FCLrDSMYE74SmL07F1EGzjcHlgrl
	 4/YOFyucAzZhD66Y+BFgtyd+wtghVIEa2yJPUYseqwjItyGu3IsjaQnYhIt7n3IrpJ
	 cIwPuYSEnqOmEyGweaN4n1BVr3xCfnZGPAB0NILbbSnC4DtHAVh9Bjp2uZ86I5njV0
	 DSlINRtEgdpAfA+aSxzGDfLsuTZp1qeHG0C6YDBScbBLJOKQTE2bcPmzLWi/YXMU6x
	 iBiK0jCccZcKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: viperboard: remove redundant NULL check before
 kfree()
Reply-To: sashiko-reviews@lists.linux.dev
To: mdshahid03@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260703105937.62541-1-mdshahid03@gmail.com>
References: <20260703105937.62541-1-mdshahid03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:13:14 +0000
Message-Id: <20260703111315.3AC361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA cacheline sharing memory corruption on `struct vprbrd`
--

commit 226dd61211b7aeb126296ed3bc673a04067d3fee
Author: Mohammad Shahid <mdshahid03@gmail.com>

mfd: viperboard: remove redundant NULL check before kfree()

This patch cleans up the error path in vprbrd_probe() by removing an
unnecessary NULL check before calling kfree(). Since kfree() safely handles
NULL pointers, the explicit check can be safely removed.

> diff --git a/drivers/mfd/viperboard.c b/drivers/mfd/viperboard.c
> index 888737b8e7be8..36be8e69f45c3 100644
> --- a/drivers/mfd/viperboard.c
> +++ b/drivers/mfd/viperboard.c
> @@ -96,8 +96,7 @@ static int vprbrd_probe(struct usb_interface *interface,
>  	return 0;
> =20
>  error:
> -	if (vb)
> -		kfree(vb);
> +	kfree(vb);

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but while reviewing this cleanup, I noticed a potential DMA cacheli=
ne
sharing issue with the vb structure being freed here.

In include/linux/mfd/viperboard.h, struct vprbrd embeds a buffer directly
between a mutex and a platform_device:

struct vprbrd {
	...
	struct mutex lock;
	u8 buf[sizeof(struct vprbrd_i2c_write_msg)];
	struct platform_device pdev;
	...
};

During vprbrd_probe() in drivers/mfd/viperboard.c, this unaligned buffer is
passed directly to usb_control_msg() for DMA transfers:

	ret =3D usb_control_msg(vb->usb_dev, pipe, VPRBRD_USB_REQUEST_MAJOR,
		VPRBRD_USB_TYPE_IN, 0x0000, 0x0000, vb->buf, 1,
		VPRBRD_USB_TIMEOUT_MS);

Because buf is not explicitly cacheline-aligned (for example, using
____cacheline_aligned), it shares a cacheline with the preceding lock and t=
he
following pdev.

On non-coherent DMA architectures, when the DMA API invalidates the CPU cac=
he
lines covering buf during a receive transfer, it could discard concurrent
modifications to the lock or pdev.

Can this memory layout cause silent memory corruption or deadlocks if anoth=
er
thread modifies vb->lock while a DMA receive operation like this one, or
the runtime transfers in drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_rec=
eive(),
are in flight?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703105937.6254=
1-1-mdshahid03@gmail.com?part=3D1
