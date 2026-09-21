Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3F04779BE;
	Mon, 21 Sep 2026 23:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033807; cv=none; b=NqDIEiAtc/NJAEykyLrZXg1qQ/gGXAGwyXn+YKTd3UXSwQ/xlFwpP/mrdamrW4q8vVLmXu/q9ZPkhkAZiM+71zQv+VCGPUhXkjVN1JRYWj49MvIbzKuzzl7JORgahdE7uvQ0LC7eMhKeE12yKkzcb/yrdQ9W/9pyiXHtTVpTFhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033807; c=relaxed/simple;
	bh=YXnDBiNJuEIkfnsxgyjQSC0FmQQa/x9+dpy6NcLMo/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BPFXxTMWjspnICtsqMKPbm0cW3kHLik/qHAg//nRNKNNGApl5WNkjgLE+F8KQfR4i8hKZ081GgKi7kU3ZfqwdWbLM6OXRsyYxwHGtUvgYVpCwJxH4Bs1iCpTATTWA5IF135wJy3vDVvd+XIFDavGfciByT5QnhfxeH6cD3zSW3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiqZWyWR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiqZWyWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECE11F000FF;
	Mon, 21 Sep 2026 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033805;
	bh=cakRPp1LQPrDjDcUD+cyuOyf4A2q/Kvi8RF+j0Imoqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiqZWyWRDCU4VkV5SijiRhvLpJJIzzwFNQjDtHZ+sHm3J3zpuBfkl03zdY3/fAL8T
	 qM/y8ms0OoOa5WQwwuOaqmdAOhfOmwfl7/M9YPr2YQGy1juHKPsJQrvcP0A8T/CP5P
	 fr5UpEWZijt5m+yxZMBGpvdFc4bd1QpWVGSkJ4sZBUTjJDDmukzS7IDXE5YLBVzgm6
	 HG74zZxOkbfhLTq+taN+j/nDuXPk7VtrQoKX3DCxAN2Fqm9ymPOWCfQYMBaj8JGjW5
	 GLYRWvGfQPo7oQo1mZoBwLStJ9aWwA3gppMi7g1HNy4a46An1qMIhgUpbwEizTcfhC
	 ZAkoESw8Kwf+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Add MT6397 sound DAI cells
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260921232649.3132592-1-robh@kernel.org>
References: <20260921232649.3132592-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:36:45 +0000
Message-Id: <20260921233645.7ECE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: missing conditional enforcement and example fo=
r #sound-dai-cells
--

commit 81069b8500a138169e7ffa4f54dfcaa00429702d
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: mfd: Add MT6397 sound DAI cells

This commit documents the sound DAI cell provided by MT6397 PMIC nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 3cbc0dc12c319..e2caa049a60ba 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -57,6 +57,9 @@ properties:
>    "#interrupt-cells":
>      const: 2
> =20
> +  "#sound-dai-cells":
> +    const: 1
> +

[Severity: Medium]
Does adding this at the top-level properties block bypass conditional
enforcement for specific variants?

By placing "#sound-dai-cells" at the top level without an allOf: if-then
conditional block restricted to "mediatek,mt6397", the schema fails to enfo=
rce
it as a required property for the MT6397 PMIC, and incorrectly allows it for
other PMIC variants.=20

Should it be added to the required list for MT6397 and included in the MT63=
97
example block, as per DT subsystem guidelines for new provider capabilities?

>    rtc:
>      type: object
>      $ref: /schemas/rtc/rtc.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232649.3132=
592-1-robh@kernel.org?part=3D1
