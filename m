Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8D2F7F01;
	Sun, 27 Sep 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525141; cv=none; b=UwVY1683sCA0pPF5vkAKV3Pm55RnxfRlSi7pQE3kSN6ghZZr4VHkn0+pYNg8UZ/WkoNJXm2FJiqLMtexIAoH2pkth6uqCWAbw5va6Ujb5viwl7S9w3unGNhbflby5VIS9yCpCdVAz19A33x/v/x5it83lDhoCEiVtfTUbnxuKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525141; c=relaxed/simple;
	bh=3TIFs3ARJKRGSxFrfMIC8BJmAim+SsIt9onyN7J4tMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KjG7w8YdkF8fdIYYtzdqewReRP4tsyYTUeVHTN/hzH3NDQkVPDXiSLC99FsUi5stvh0qCXB1cF3TFZxx/FcOjaneFCozr9VZULUIVYcYdtHulg7bu7eWduWYsINl0VatYcIcYyVSTTNG3CySs1zoXPBJYfmVVayC59HcKCoYJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt8Rd0ZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt8Rd0ZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95F11F000FF;
	Sun, 27 Sep 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790525140;
	bh=up7LABadlvc+CHzmPKL4Tk580/tJ8QA/P1BbGOQm1C0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wt8Rd0ZZj/v1mj6la9g5rct2S5+O2MEB8KEoplJrt+cVKIZs0PKSBgBqpJsnk2Phw
	 YeHsIYmJ768nXAPBg/YoNw6/68naxGqHneRkjupikz4g9uTlAVeshvTqO0NTIge5UH
	 S2hZqtwfbr6omyZVHKyhmLEB19QF48u50zxcorJLr8BLjIHgLtmHt7mPICbz6cnxW9
	 qLUabuXdfCYZAHFZso19PlhUiNkKUuLxYnazqG1+vpE98KzSurKlNUCO4HgObLrEzQ
	 w2GxEjdZbQOrD4Lm6sB3EkzypUU+ev7cecd18meZm3KpNidVLBDAcoLkT/90IsqQPw
	 T9VyND8AWuSJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] regulator: dt-bindings: maxim,max8907: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260927155745.187758-2-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
 <20260927155745.187758-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 16:05:39 +0000
Message-Id: <20260927160539.E95F11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: broken schema reference to tegra-regulators-couplin=
g.yaml
--

commit 5ef18cb507e67969206ad4c580a12c88380df6ac
Author: Svyatoslav Ryhel <clamor95@gmail.com>

regulator: dt-bindings: maxim,max8907: Convert to DT schema
   =20
Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
to nvidia,tegra-regulators-coupling in child regulator nodes.

> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.ya=
ml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
> new file mode 100644
> index 0000000000000..e4e1390a49b9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
> @@ -0,0 +1,285 @@

[ ... ]

> +  regulators:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^(sd[1-3]|ldo([1-9]|1[0-9]|20)|bbat|mbatt|out(5v|33v)|sdby|vrtc)$=
":
> +        allOf:
> +          - $ref: /schemas/regulator/regulator.yaml#
> +          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.ya=
ml#

[Severity: Medium]
Will this reference break the dt_binding_check build target?

The tegra-regulators-coupling binding has not been converted to YAML yet
(it only exists as nvidia,tegra-regulators-coupling.txt in this tree).
Because of this, the dt-schema tool will throw a RefResolutionError when
it attempts to resolve the missing file, which breaks schema validation
for the bindings subsystem.

> +        unevaluatedProperties: false
> +
> +patternProperties:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927155745.1877=
58-1-clamor95@gmail.com?part=3D1
