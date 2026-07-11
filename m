Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965113264CA;
	Sat, 11 Jul 2026 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750211; cv=none; b=dyULrVc/rVaR1nL1aoJQT8YO42EZD+1V17YHJw/Y9wY3/1oreDv36ok7S4giEQOEciM8RH6jjqXtyNocBHizl62zo1zew7aisAE3gQcKfIqvKHwAQ5xtdpX50yYPfwYF+T4QxPSBxFNXYnMWcWZ0fqhgNG+wfgGcX7ShcMRbBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750211; c=relaxed/simple;
	bh=hRq8MzlB4zckINy/IvEmXFjaoic1cjZh1xYjdLVFRws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AogRWhLcVK2vz//oTrBlMO/HzvRSDR0W3rb7/gaVEE7iQDl1vfkcHhSL8QgqJKkNIZb4HYhQh7U1VytYonvp6KmCDEVCh8dbc85GJqEBGTddhnUFvzaRiE3IeA2UQ9mFdwHd5CWgDdt5B+DxE84MT6v2QBUZGI+2vWCvOB8FL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fa1wihgb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fa1wihgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91F81F000E9;
	Sat, 11 Jul 2026 06:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750210;
	bh=ZAM2jUdN308a8tY5WtHFBt7X2lKYF3lXXnVeda7cjrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fa1wihgbKovt39uvq61xPeycP8ILlzXO5XYxedWGo8yThvumGysxNuLnPY1yyjyig
	 /CLQlr9+3LY90aHlhvp2CyFWmeZqp64nGpw/es7Fg5Z38qqBz0n6HQ424G+0bYzW/c
	 jW8l0UjG/mTh3yoyZhcR068ziFD9rz3QL5aiVjPpUmKpp7OL4icGUrVMGZmckZdgv+
	 R1GixHb+twJhqaIrxBeeVXmDip6FOg5eaf+Es3+g04B91zwY40UtwhNs/2E/xbwI3P
	 eWZxHfIjEGuiz4p5TvH2tUqUbYi4WATGHlKuqB8HmJ3MuwtU4SQc1c+iolNJnC/Vg7
	 /RneWxrgi7PBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:10:09 +0000
Message-Id: <20260711061009.B91F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `$id` and `$schema` fields in the YAML schema contain invali=
d URIs, breaking schema validation.
- [Low] The `status` property is explicitly and unnecessarily defined in th=
e binding schema.
--

--- Patch [9]: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card =
---
commit 94d05b63d0a0b038d3a5355e6b58cc3b78b60eeb
Author: H. Nikolaus Schaller <hns@goldelico.com>

ASoC: dt-bindings: add OpenPandora Sound Card

The OpenPandora audio subsystem describes the routing links between the
OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio
codec, alongside amplifiers and power supplies.

> diff --git a/Documentation/devicetree/bindings/sound/openpandora,omap3pan=
dora-sound.yaml b/Documentation/devicetree/bindings/sound/openpandora,omap3=
pandora-sound.yaml
> new file mode 100644
> index 0000000000000..d3c747e5c58d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-so=
und.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org
> +$schema: http://devicetree.org

[Severity: Medium]
Is the $id field missing the full path? As per the device tree binding
guidelines, an incorrect $id field breaks the schema cross-reference system
and causes dt_binding_check to silently skip validation. It typically needs
to begin with http://devicetree.org/schemas/ and exactly match the file pat=
h.

Additionally, shouldn't $schema be set to the standard meta-schema
(http://devicetree.org/meta-schemas/core.yaml#) instead of the base URL?

> +
> +title: OpenPandora OMAP3 Audio Complex
> +
> +maintainers:
> + - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description:
> + The OpenPandora audio subsystem describes the routing links between the
> + OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio =
codec,
> + alongside amplifiers and power supplies.
> +
> +properties:
> + compatible:
> +   const: openpandora,omap3pandora-sound
> +
> + status: true

[Severity: Low]
This isn't a bug, but is it necessary to explicitly define the status
property here? Since status is a core standard device tree property, it is
implicitly handled by the core dt-schema. Redefining it here without
constraints is redundant.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D9
