Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABED2E06ED
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 02:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749412; cv=none; b=OdOLcoeWsXxhxFB7dAJe3wqdr7bPcJrRersUcsm9j8q1TMVynj7x+BHFhiRLPmaBNHKf7cO3PF7r/FEiaJKWZrXTqxn2yxhiDTU8e/P08AP6M5We7/Lr6beRrdF3HKw+kCFn0LV2kkeZgLSJSnTpJQ4SQQCg90ImFshwyZMPGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749412; c=relaxed/simple;
	bh=rrRE5SDDAivhHNvXKTW8SDKeaKgee6j/8xqVBSoxlC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OElVS9r39PX5UqcyXmLRCUOpWoDE+0vW6OO5L5o49/r7/GcFipLn4gErzx66kM9nEKRLsXx1BJFSE9IrDHHQQpJvf9REuJwA7snZA3+FsU+wx2L7asjsMNpKRM219fhZHOU/LD72DuymxPO+3ncZFzxyKgOaAIrD44cq/LfCHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRdpgoDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRdpgoDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2634B1F00A3A;
	Mon,  7 Sep 2026 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788749411;
	bh=fFXF/8jjch3xSQ7od7lZXPUalIStPFNew8LqbPeMrRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jRdpgoDGBN9zg6DPuftcYgttjJL5DzzAdHr4EIGny2vSM0IqkTJoPdwzHl3aa13rX
	 1jeDv8aGWlsoEMdgaP1n2WpSd5gZex3egaY2sW43ZZytNlk2HYMpOwbEv/J4xasHoa
	 UJMBLvM9x1eV6eb2ZbfHLiDM4MgxCCVvOOToASVvpdpJYNgrbUZK19ZzK4kvmAhcIl
	 1CV5shQg+I8IdAwlznDnkrL08jtQzeRdQ21k7WVofEBs5gnIXZNeUoZ50F313gJaRg
	 DATxYwQkHyVdzIQeQ36SdQ+cQ+CbCiiJ5ElEBQgDgjBzKV4c/XEAoz4YpC2S1T0UII
	 sv5+rn4SJmpKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] mfd: loongson-se: Add multi-node support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260907023827.14905-2-zhaoqunqin@163.com>
References: <20260907023827.14905-1-zhaoqunqin@163.com>
 <20260907023827.14905-2-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 02:50:10 +0000
Message-Id: <20260907025011.2634B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Architecture Guidelines Violation: Bespoke helper functions expo=
rted for MFD child drivers.
--

commit 5586c039b03a6072df309c0fa8d59ce3ed3dc98b
Author: Qunqin Zhao <zhaoqunqin@loongson.cn>

mfd: loongson-se: Add multi-node support

On the Loongson platform, each node is equipped with a security engine
device. However, due to a hardware flaw, only the device on node 0 can
trigger interrupts. Therefore, interrupts from other nodes are forwarded
by node 0. We need to check in the interrupt handler of node 0 whether
this interrupt is intended for other nodes, this can be accomplished via
shared interrupt handling.

> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 3902ba377d690..7f552a8ee6a26 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c

[ ... ]

> @@ -211,24 +216,26 @@ static int loongson_se_probe(struct platform_device=
 *pdev)
>  	if (IS_ERR(se->base))
>  		return PTR_ERR(se->base);
> =20
> -	writel(SE_INT_ALL, se->base + SE_S2LINT_EN);
> -
>  	nr_irq =3D platform_irq_count(pdev);
>  	if (nr_irq <=3D 0)
>  		return -ENODEV;
> =20
> +	writel(SE_INT_ALL, se->base + SE_S2LINT_CL);
> +
>  	for (i =3D 0; i < nr_irq; i++) {
>  		irq =3D platform_get_irq(pdev, i);
> -		err =3D devm_request_irq(dev, irq, se_irq_handler, 0, "loongson-se", s=
e);
> +		err =3D devm_request_irq(dev, irq, se_irq_handler, IRQF_SHARED, "loong=
son-se", se);
>  		if (err)
>  			dev_err(dev, "failed to request IRQ: %d\n", irq);
>  	}
> =20
> +	writel(SE_INT_ALL, se->base + SE_S2LINT_EN);
> +
>  	err =3D loongson_se_init(se, paddr, se->dmam_size);
>  	if (err)
>  		return err;
> =20
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, engines,
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, engines,
>  				    ARRAY_SIZE(engines), NULL, 0, NULL);
>  }

[Severity: Medium]
This is a pre-existing issue, but does this driver export bespoke accessor
functions specifically for child drivers?

Looking at drivers/mfd/loongson-se.c:

struct loongson_se_engine *loongson_se_init_engine(struct device *dev, int =
id)
{
    ...
}

and loongson_se_send_engine_cmd(), these appear to be bespoke APIs explicit=
ly
bypassing standard kernel subsystems for cross-driver communication.

The MFD subsystem guidelines expressly forbid writing bespoke accessors
or helper functions in the parent to pass state to child devices, as this
creates tight inter-driver coupling and initialization interdependencies.

Is it possible to refactor this so child drivers directly access parent data
using standard APIs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907023827.1490=
5-1-zhaoqunqin@163.com?part=3D1
