Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3F41F7C1;
	Mon, 27 Jul 2026 19:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182405; cv=none; b=mXxFn7MUJtI+GObiKAmO0BvaBz5+W6d0VqgAj0QrTw8kTTnrG3hclqabW82BQsmMX56tevEF+Itq2MtcJ+DiFHFA0dUdh489MpkwakN4pkkGUdj+jRztOFTG7aH2EDLTHCwFDY+DRXfIAlZ8kwDQaj108/H0x2k9ewQ6uvCwZYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182405; c=relaxed/simple;
	bh=8aV3ZYbns/EZJvf5774H3ggZYb3y2v4i4G6gpTcCUrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPHMfQaWH8E2G41IGhc+hgg0t3GhIOY6i1eOQv9ZfLK3d859co2DZO8f5ydBQLA4/mlAqWN+SYNAbKyoY9ZcI2DroJiOzBWhHeaIev2H+01erbvSgbTpX/cLmnMb+6njOUWh4kAhqc9yn4P/2Cuni/5+/5GltjO33NdsmNcpEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URKxTNhF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URKxTNhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB7C1F000E9;
	Mon, 27 Jul 2026 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182388;
	bh=FDiV7rLci69xDNm7Qyr1WpfDhBaxkoOH9fi/2rAGev8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URKxTNhFx3tEthoSedy3nRshx4iYI4Ed6b0h/2TxnpI2bsCGspjqN8PHIOvTei2tt
	 JVY/rCjbV6BofDYNqKDxHVDnPUxiAEVTaftYn6LYeVh2DPpwpYJjv3PwDP/5sGjcV8
	 /VmKKgtRD5h+wosESaM7Gqmnk0O5gTuSMUq6EZNDk41V5zW2qrCnYAzNe/3M0zbv2F
	 hMIQl3iSI8kNaf9rObspop7TpsMxa65lIsdkCTH+N9DhiWLoLGQFbb7sPZmc+19AbU
	 fI9c9zmO3xUV02rzxdr58mKcg3anWcUdcA3PCmWuV4TIIljwu+LmecoYZfSv5LKrXE
	 033SXbwwhy+JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-zx29clk-v8-11-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-11-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:59:47 +0000
Message-Id: <20260727195947.9FB7C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Kconfig entry selects MFD_SYSCON without inheriting its HAS_=
IOMEM dependency, risking an unmet direct dependency warning.
--

--- Patch [11]: [PATCH v8 11/12] reset: zte: Add a zx297520v3 reset driver =
---
commit 12743a130823c55b091e1dd6972558ed49c19d61
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

reset: zte: Add a zx297520v3 reset driver

This commit adds the reset driver for ZTE zx297520v3 SoCs to drive the MFD=
=20
child devices created by the zte-zx297520v3-crm driver.

> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3b..97f41574d81d5 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
[ ... ]
> +config RESET_ZTE_ZX297520V3
> +	tristate "ZTE zx297520v3 Reset Driver"
> +	depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
> +	default SOC_ZX297520V3
> +	select MFD_SYSCON

[Severity: Medium]
Could this select statement trigger an unmet direct dependency warning?

Since this driver can be built with COMPILE_TEST, it might be compiled on
architectures like UML that do not enable HAS_IOMEM. MFD_SYSCON requires
HAS_IOMEM, so selecting it here without inheriting the HAS_IOMEM dependency
can cause Kconfig warnings and potential build failures.

Would it be better to add a dependency on HAS_IOMEM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D11
