Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BB31715F;
	Tue, 21 Jul 2026 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637003; cv=none; b=WzD9AaVz68jCLq+su7jqeijBAbwyjY3DrOaWnKUijDH5UblFjQSYXemtD+SpOG/idCttMvFKwd8nr3Oc/IRdZ6tJIJJjxQQ0N9u5NZ/ygR5lxqKCOb6TKQ5yn0yit5eZIXSCCmbkoLTlMjnpgokrluIchf41CYjb/svzd/sbWU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637003; c=relaxed/simple;
	bh=fBhX6zMTQMmj5dMAVxVqR1NW2I4TSYUjyYUYMbZ/UDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5f+Sp2gXnCPCxsK8jV5WQKvoBlx8JcXyhqM6PkpW1/7OW9w5VGhYw4C1F5J5FvenHfHoOxna89tAqZCgNiO5TqXuXfnHuZhVomLA9c0XY80w8mfqaY6GgYC38Xw7ROU/pcmFJuiFTUha3GuVaKsIf4VoxnmJaGO8jdRFngK+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGlWwK1e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGlWwK1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889C91F000E9;
	Tue, 21 Jul 2026 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637002;
	bh=TIxJ/MYUTmDzABhR3HKhQmIMrkdxe6Ake+nRjJFaDFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dGlWwK1eDubF/JYMHVeG0wRzCV+aE8kZ0IEdCWplWC+L80F7+XtmuFm2+gIPefNQC
	 UgkBFBlBknGNshEDO73jbkV44nPDsqRN8N3UYVgKuXyZIDrHNFI7PwWffPU9cXjHCJ
	 KjS4c+RYpWePUZ4b1JuA50bIO5Rkw56hXBWZEz2X8wy1eBE40u2xKZP7wa+6FDLEQO
	 xkAQNR+1HEvzgrRIHUiF/8ruAIDWvzrbl9d7SayTFOOXxttauCHS8eRRmGv7/gaUPG
	 QD7lzz8S14WnNbTmxLlrewUWwXPnKTn7fItt8yHbZz0I1yxRTIHwvbMLxxcgOa8rqR
	 oCiYCEhgZJh3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: syscon: Allow syscon
 compatible for Loongson-2K0300 chip id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <bab36775095bb85827676b2db917e6cb9527b325.1784619512.git.zhoubinbin@loongson.cn>
References: <cover.1784619512.git.zhoubinbin@loongson.cn>
 <bab36775095bb85827676b2db917e6cb9527b325.1784619512.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:30:01 +0000
Message-Id: <20260721123001.889C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string added in the patch contains a typographica=
l error ('cphipid' instead of 'chipid').
--

--- Patch [2]: [PATCH v2 2/4] dt-bindings: mfd: syscon: Allow syscon compat=
ible for Loongson-2K0300 chip id ---
commit 5db600cb90f648eab2d8d155fce1a1ef7e8cd50e
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dt-bindings: mfd: syscon: Allow syscon compatible for Loongson-2K0300 chip =
id

The Loongson-2K0300 SoC exposes its chip ID registers through a syscon
interface. This commit adds a specific compatible string to the syscon
bindings list so it can be referenced by a phandle.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index e228670880631..c5b2e28f6cedd 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -76,6 +76,7 @@ select:
>            - hpe,gxp-sysreg
>            - loongson,ls1b-syscon
>            - loongson,ls1c-syscon
> +          - loongson,ls2k0300-cphipid-syscon

[Severity: Medium]
Is this spelling correct? The commit message mentions the compatible string
should be "loongson,ls2k0300-chipid-syscon", but this adds "cphipid" instea=
d.
Will this cause schema validation to fail for device trees using the correc=
tly
spelled chipid string?

>            - lsi,axxia-syscon
>            - marvell,armada-3700-cpu-misc
>            - marvell,armada-3700-nb-pm
[ ... ]
> @@ -189,6 +190,7 @@ properties:
>                - hpe,gxp-sysreg
>                - loongson,ls1b-syscon
>                - loongson,ls1c-syscon
> +              - loongson,ls2k0300-cphipid-syscon

[Severity: Medium]
Does this also contain the same "cphipid" typo as the select block above?

>                - lsi,axxia-syscon
>                - marvell,armada-3700-cpu-misc
>                - marvell,armada-3700-nb-pm

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784619512.gi=
t.zhoubinbin@loongson.cn?part=3D2
