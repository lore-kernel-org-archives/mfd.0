Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D939DBCC;
	Mon, 21 Sep 2026 23:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033577; cv=none; b=EHnT/t97aVJmr5uD2gtiZIEI1RVPiFOjNrXV82zOByOn0f4MnOctmsEGMXmJ6zv6RAOjNMHKg9jFJkRW9AgAVWSxUb1fLNKNgwcu5q4ImBarQ7VkH1C92TGAzRcyFMD+qd5FuhYo/9kxEeN0VSseHMb175TzWoXF9g6TCJg9opk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033577; c=relaxed/simple;
	bh=fCen0g4qVuo3G8S/vPTSWQ8fa3QzFNn5w+HJ1PMMDJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OziU+pj1SxMznMBK+sDkpDXSFitxUJFGVsIL+ks45G/FqnJG5qhxMOJdl0fqaPHksX+RSOxkLf1euRRSMVsjVSCZ/iDMpQpCb/C+tLlmismce2YYQfvJm9L2Qf2+gxlkU5+qyUNseQM9B6QfN7f7XnsOttjQE3Fm0uD4XsrEn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxW47k9V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxW47k9V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355351F000FF;
	Mon, 21 Sep 2026 23:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033570;
	bh=S9QCRLpNsIde2LK4+knTgVJKcVsnMGHI0siP8bBvLms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GxW47k9VaBhXjMDhay3v+O8eeF+QK1ubSgQIyFGjY1Qx2t8rP7sJje2PraarAzFPT
	 MZBxbHPnKZLf6TKb80YTYGW6JtvnGiyGTwoQ0DuA4CRjK71j6p2tiw3D/tD4OgNcqd
	 8qI8ilRH4J/tFiqjZAYRbKcSFmH6htdOltGwA0VxA+p8SQzqZ1z/6bhzr9Fk3AZlKB
	 Gyi86BWWCcXVcdReUdT0LXowMzd+KVVTrhPiZLxq53yNd2gh27ltvfrBClptFTQCQd
	 Vv35JVFzR9ETsuh6d8LePOHBp8S4VASkoKCNjUSY/aSU93ldG5BV7sO4LzSBOj4qRd
	 sBgeTapEqGuww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Allow MT6360 interrupt flags
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921232701.3133291-1-robh@kernel.org>
References: <20260921232701.3133291-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:32:49 +0000
Message-Id: <20260921233250.355351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: #interrupt-cells uses enum instead of required cons=
t constraint
--

commit 3c231e0793c5c72fac7dc860b2b89ed70228f7a3
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: mfd: Allow MT6360 interrupt flags

This commit updates the MT6360 device tree binding to allow the interrupt
controller to use either one or two cells. It replaces the constant cell
count constraint with an enum to support an optional second cell for
trigger flags.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> index fb65abf30d57b..828ed7f558f66 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> @@ -33,9 +33,10 @@ properties:
>    interrupt-controller: true
> =20
>    "#interrupt-cells":
> -    const: 1
> +    enum: [1, 2]

[Severity: Medium]
Does this change conflict with the device tree binding subsystem rules?=20

The subsystem guidelines mandate that cell-count properties like
#interrupt-cells must use a const constraint rather than an enum to prevent
ambiguous or variable cell sizes during schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232701.3133=
291-1-robh@kernel.org?part=3D1
