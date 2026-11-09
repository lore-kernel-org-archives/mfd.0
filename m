Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254591;
	b=w58t2aWL4cBpkSyoidYQ6A0NFr8B1vs0a5Xgk1jlcGM2NcCSbVuU5Ki3A6JiCGKIvLw1
	 z9EdbrakCI9NqMQZb9uxGDd6AcjIawGKseE0PXB2P55+No6LM9Pt3cKrUP9+/VtdIM1uu
	 jsWqFZxAbynr3E3XwKuIuYxudmXc8omPv4VrfkgYcm/409bbVnKHQygyq3yA9+6P3oqkH
	 Ouu2+VM6QnOMIP/D8TxCa33TaCdo5Z+zPypq2S4iRr/leGjND40muAjpo0gTKQ/IHHaGW
	 A3mLDJX8upvq5wXuGO1rWG663O7K2GE16t9YAC+dARUF7+yy00Gl7sygaP1NRvfoKwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
	b=YAwkkasZKD9mFo6kxpkdLPwZh3IOWsaFeWlT0WDFvNR/dOLQEuHakiW9CY/2DhNvD6D/
	 GqzY7W72agWtqudDw6fD/AiVxTbZxfnp4qAlHKhVhEVbpg8a4esBtSGWhGUMhr2V6DUyk
	 rX1lZ3k60lHI/uOpTeLjXP3GZEFFnwL7NteQ1XUa7OqP/r64oy/8Zji5BXvd9NBJrAs96
	 EYVVGQZl1neBAuFJdsKFKdwYkMkynDtcJgB/r4lwnQBl1FKUXhOi6dE1tnc+vz5rfrg4K
	 lpAJkce8y7YtYA/zl13XDoc0t1ihFgO9MfT/U6/cC8Sq6Qjjaxf5RInwduD/AKX93uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsAYopHZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0118F606A331
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 20:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0118F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsAYopHZ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1314764eec.1
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 12:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254590; cv=none;
        d=google.com; s=arc-20260327;
        b=Ot0jWUbAlFWqvd+GYhcZmhw1db/O29r+m+imcaNM+afwayIWZloo5I4mglZ0twa5U2
         cCH9QMPkd/anKZmD2Bb8FHfR+tT+DBBQN7ree2xbXiWR2GsN/EaUiS2nwnhtDxLOxVip
         NMXGE9aNS2E6dS5/8gu2xHwfj5qUdyyRG9emi45lzwbij6WkVxsOSA68END8X/i3i18C
         zCCFVfIPIVM2zRI86GHkntgAc34v1dya8i49gcDG63DgtrO3wj3i9uFOwJLmpGTQhikW
         ++c67wSVJkFf1P3iPvlLasx5KDWNCycLY/GbirwuXUvqXJwIbBpcVOW/SZmskzdHJ0so
         +CfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        fh=DT+5NXqu62eNTS3Dc7C3iVJfzVqbglsI9e3tsFwBlw0=;
        b=oh4ePQK2o40o8uOxuGW/RbWjxzQayznFvH6WXSDtaqjyRTVGXviW2C8KKpJgWbCAOa
         Zjz+CtxUPowqRJqJEf3V8O1eaBx1OhRboX/XODEUIfnaz/G9I5mWFe0e28vETQ0MbyZo
         4ujXc5burPCYWWxnPENsvgB3vm5aGQYEpMyQqXtBYrH4G5DKFsyOsEpMO5qv4SJd/y9X
         xorbGUGx9NH6QF26xwq3cDkVTR2QRcqnbsO6e5ZhUnUV3Pu/23I1Y3wbC5WQ/jcgzyXU
         +j5pOuFyH1XeKwquXh7/5AJFJ+C0M3FEtq59VwOSVdud+5f8zSbarm660ubFC4V0lDoN
         5hgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254590; x=1794859390; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        b=rsAYopHZ5R0mrh4Gl3jU3ZeCyt7A0gEQkpdFBAJ5TPxRQ6i5terHUdE89fgqLhs8xY
         lHgNL8lsnk7e7AT+dmYFBFV2rBa72sLxh92xWbKEX3NEzY3ja+8PosvCxJQTKDPE7GBj
         6woaiICsJkc2dKSuioQrm8ASWnyFRxhX08FGo2w3fneyazXqpt1pCzsgC+NQm0+J2dJ+
         XT1QGlgXWHLwXW5EvmInM1xjbF+Q/EMoos+w8dPk/Q+oX95REZsaCbmnn/V3shKIS8W/
         Fg5fsddd25GN7G5M1xScm3Egk8EelMPwFte7Ihrnr86YwNjH8S7VZBvpIKihE59wMz8U
         X8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254590; x=1794859390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        b=r3HhYdT5rBlxbLNv2iNMxeB4zdl5Cwn7gVHcVJvFR0PnJ8GmdY19dKONdTGuTGrOk9
         N23Abul3cc/ehxlay5wYB55zdRbKHwaxb2D+pEublMpzcRxxJPFfiLl/JVUf2hSEIRbk
         ybfE8RCTvOkIrymNVHh4RcsyTTTIxh4jbjf3xu9EisFrykGywxL4FL+NvBEOj/tooHG8
         wLcJd2E4M+UQkQPlZhW7PVaReCRNaDJr7tua/Srdq6QZD67L2ydfSEytxSEth25+8jue
         ckKrPH2el4Bvcp5FNiBXJgN7Iedh4zmmgc1k9XaOQggIT4m7dOvRMSLMCDYB0IHXYLm/
         RlWA==
X-Forwarded-Encrypted: i=1; AL+hErGxJn563Ybbc5HZSX6mfiIo91gmMA4RR947K3sBCQpX3wU90PdUgSdjIvx7E257dGy+UN0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/QfncklX+J6JjFjCyzPkKUGzx2R5OqT8TXt1VcXpaGGgHJBe8B
	Vn0+8E3Yw/uXqp0/tJZUWeDA07Y6T8jwS1BNHTaEhIk9P3Hod/FvmMBwRgjVr08As0V7SGwC38q
	vDvuMdRc0Na+stLLnDIwDtbUedO0KCuA=
X-Gm-Gg: AYBFou0C0juxTySUIXIWGVDxzNo/YufG//Nei0zg0jEUEV+5pZgQ3/4+vVmOGNSNe5z
	crOc52HRxd5LpIcYakFDKeqBcqzHkfGwcYKSlq/TgZA5ZasKwfOwAGTuTriTRsIa57f2q7L2BWw
	UhMBXwWUmmPvGGc+WsBQMvPQnTmRFtUAQD8h0rWwOjjwpLvmhc8G1IAmZYDV7kx8WUZiaOd335d
	SE/3ESg8yUSpIESq0WFh0UaeK1L023eq9toViIjI+r5RxzgamEPFX4z7IJS7TVVnied4K4XG8xU
	NuJiAXPkm5As5zDzT5lg01wtL7tyneWkGA+6h1NdZmzO6xbuAmoST1X55y8Q3lnKzAMpYcArNqp
	Xgh7EVKEWAQzwBx4sseGeXqZlVbDADJHXfAM45F/6w+da/N6VV+VAUGff2rjPW/jERFRTUyQpPw
	MBqeBq+tiKejmpCIHKbPq1mM63Op08yQ==
X-Received: by 2002:a05:693c:6407:b0:36f:65b6:d137 with SMTP id
 5a478bee46e88-3751f45ff37mr398564eec.24.1794254589952; Mon, 09 Nov 2026
 12:03:09 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109184654.462128-1-robh@kernel.org>
In-Reply-To: <20261109184654.462128-1-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 22:02:58 +0200
X-Gm-Features: AclHuK8Ot5ZO4cc4X4se4NcLqN__nckTkG3zWRI4jvXOHVz-rvBOJ38JU8eIc74
Message-ID: <CAPVz0n0qTnbERGguriGSn3r+R1UnLAo2hFSenC7ZC1S7a7yF8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Add gpio-hog nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:47=
 Rob Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Some Maxim max77620 users define gpio-hog nodes, so add support for them =
in
> the schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/maxim,max77620.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml b/=
Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> index ac063c2bab73..99014b792a74 100644
> --- a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> @@ -165,6 +165,13 @@ properties:
>    regulators:
>      $ref: /schemas/regulator/maxim,max77620-regulator.yaml
>
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
>  allOf:
>    - if:
>        properties:
> --
> 2.53.0
>

Thanks!

Acked-by: Svyatoslav Ryhel <clamor95@gmail.com>
