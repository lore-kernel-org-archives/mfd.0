Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19542AF9D
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 07:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829797; cv=pass; b=pngWgbSevGYP7TB1B2lZptPwmYoxUI2nZwSqjok22/nlvCnMSXQ6IYvWO0XirGL2OfMGAj7GO1ce9Pol4SdqZgzDOXkDpfKCViEgxG1WSY0G4ZAkyyNK9nh7yz1PIytHIa6DctjRjKRIK/HV5bAF/uHMrD0hjWUiOvxbqUFHIYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829797; c=relaxed/simple;
	bh=OmWlM/JGJt4Vhs83DOiTTiO0UFaa1QDbwgGwrj5GUKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLNFUUVcDWG8NMF19maLfe5CgSuJI/54QMGGa9CXmfmR7gz9mCdYfe14R2fuo02Ee70OC0Hkvv6DOt/TiCiggKuvZLNJQEh+VSpepgG9/tRVcRqYRCQhWDGI8At5fAuDagRIUl/bEcMmdluWROB/5R20/fqaNkXs8sK471GKv8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVkMjXbn; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVkMjXbn"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1712a04ddaso684910766b.2
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 00:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785829794; cv=none;
        d=google.com; s=arc-20260327;
        b=W+8jo4C8XGrISCvhs1Pm4SAFRYQ2IdtwaspgqZDSEr+d30zWCcjS3OapUtOzRMOKA2
         XOs4RttZSrHCx76/Kb9KakbZaIjt+RHrCXVF7/uR0fr2ZFj7EzhwLaE/WnBaJ8yLgZNk
         iumfHe7aRj9CMleOsUUQfleqJ5YZOd4JAGYorRSX2TGXIw1c/uAFN7HLKrk8weBTjYJ9
         H5FUQJgCmK7PbrHC6DftrSJU7/jRz7+WDqBUct1f89WR4iFvqj4YzEG183pEozX9POEv
         N70TSk2Znj5iHTh8FNKDiJNlqy6Mr0Dgb+QzICECfn3NtPllb1YxQXYQsnjOQhUS+T9L
         YVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tIHHVDdHYzYzDyqpm0ApPfqei6BlC/PdRs4c7TbsR9E=;
        fh=eQHrI0KtevG8t3XBtxwJlTNTzDj7zTeuxWp/H3iuFnk=;
        b=TfW6T/TjNMH4TMFWsgATRy4nZl2Ykt9O1/FdaBHry38J6Qh6kO/JIzTRXcvB9ThJk/
         ORZNWqZ/JDIO1z9mI40Nq8QlP8MbiLh0PLdCO8qiuVz62PL1T7xzQ7c0+FWG5cGVh4Yo
         ffo54pDl9Z+g1mgXtFsl8mPF+Ror1prEeJuxyJ6gnNAhQfIjhKe+oryy0koO9CNeX1+t
         h2gaENMTeznnkLXMl5KKmA0gr0gc7FVsZ8Q6B6gkRHN9DXuaX/tvd/81I+RyFSCVMs4K
         PXtIdSWuQT8kZioCCA6GtNGD7e4hmOEFONEzANViWsTu2lDil9hjFPvnNa6la0iSfgLJ
         MuuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829794; x=1786434594; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIHHVDdHYzYzDyqpm0ApPfqei6BlC/PdRs4c7TbsR9E=;
        b=hVkMjXbnCKxDOe/45TfZ02go1k8QDSO2QLO5oIzUUMYegqEcpcgvB37fwXA/FXS2XX
         UhweJbXrgpLMct4x/gnmXs7EDhmdxQRlnwPR4P/p8sHCYGpKarPE2CdUcQ4Jn692zFy2
         B6lG7vbyG7qebrAXJJSDtgZJGFZ5SSp8a40wagPk5IJc5SML5SAHXdqkCWYzYzSDuJZ9
         fdbrWZDtzGtEUduub8ztH9BbH/EROCx9oAIcE+Sedvdb5WMMzTZljec+ODpz0CPWEG86
         HOwXGnlkQFMV2v47cIyh3nxHRk+yG2df+YI8hyq3Qbs7w81/rrVu8sBwsxynwGlr7Be6
         9hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829794; x=1786434594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIHHVDdHYzYzDyqpm0ApPfqei6BlC/PdRs4c7TbsR9E=;
        b=sv+VJdsQCm4VddvMnJq3qRsHxrE6rEcgl9EEawZYJyQQib7/aXslrMDVgaTNuk+DVL
         OmiyutxG0AbD0Haqcc8dvmVI1jer8bmqi/FRK/Jg3YEMBJ0UnWYV6SdcBTm6C2etEQHz
         eFmjGTrASEZcrF9vreWK8UVy4b4wI92CwzGHiIK0E9vkaoGQ2IOEvbNo7YtSdWaqYfmu
         oO1ZC0Un31IIYjugslEpPPEl+oaS2St2hKQg+QAe616UdDTalDp9ncF8y8diT2UU0VeZ
         1DxwHcBM231n+MfvioNkTj0ApNdzXL7Y/k7aclDxUDCalSL6/4JnSMo1Y2Ei1sbC5EGI
         9WDw==
X-Forwarded-Encrypted: i=1; AHgh+RpNB3PbgtVALM7uXFn6nkhsOjpmGm8ECNo/7G9T/8htdFmBMRYsH8f6lh9+DxFBDHYSpVk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhREh/IXE31+8a00TpA1MfTVGs4rl/qzBDnb5xH/dQ4ys6bo/O
	wP2UngZ9OD7vqkgSQGGUY4c6C8PFa73m4yp37gaft3nftZDvf6+675Um2tAYZTYPHcI/ndcklcP
	4zKx5TpiIArgcGFGMwSvj52zmMOQQnfw=
X-Gm-Gg: AR+sD11Gj+vdVBHSKtkaTTNg0mTFrj29M/KfpHuXn/cbwOIflJO+59QCahivlk8kji+
	sGjYLRAXfVPX5x43aKnhk7Vo4T4HAgn8Wvw91iUCR+w475YD1RwMAAz7BYn/TSy9xj1qLge90Nt
	82/agsq+kOKkHiBHYr2g6TV0hAxAU3x8ezmdXeuoE4rqRIuwXKk3eD/Aadg9VXcejXDCWzNTtxK
	VRtUfxx9pKX66kKmhWqDDqXSw6ni2T3+RtQfqw2agIgTt28TJ+xuDJKDUi+yQGCKQQsxm3TTTAZ
	6wDxSq+jOWYgClKN+ljWKox4OVC0ORnsRCS4oOt5Qnge7oE=
X-Received: by 2002:a17:907:3c83:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c1fe80d7742mr1126518766b.27.1785829793494; Tue, 04 Aug 2026
 00:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785480242.git.zhoubinbin@loongson.cn> <0fbb8d766b6ed33bf4ae9b066eac174f55ae5b56.1785480242.git.zhoubinbin@loongson.cn>
 <20260804-intelligent-kickass-squid-e4c4c0@quoll>
In-Reply-To: <20260804-intelligent-kickass-squid-e4c4c0@quoll>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 4 Aug 2026 15:49:40 +0800
X-Gm-Features: AUfX_mx5oxerXvL0N18GQL0cgfDF9LTPcv7Pk-z3jk4krWgDnaxFa1jCKZmpg4c
Message-ID: <CAMpQs4J+RSF+rk1RJW-4+mbaeWpAzMKeiZo1R=B-wfXnAM5ScA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: mfd: syscon: Allow syscon compatible
 for Loongson-2K0300 chip id
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

On Tue, Aug 4, 2026 at 2:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Jul 31, 2026 at 05:42:19PM +0800, Binbin Zhou wrote:
> > The Loongson-2K0300 SoC exposes its chip ID registers through a syscon
> > interface. Add the specific compatible `loongson,ls2k0300-chipid-syscon=
`
> > to the allowed list of syscon bindings so that it can be referenced fro=
m
> > the thermal node via a phandle.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Docume=
ntation/devicetree/bindings/mfd/syscon.yaml
> > index e22867088063..18eb9defec8c 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -76,6 +76,7 @@ select:
>
> There is no such select in the code.

Yes, I see, I will rebase on the linux-mfd/for-mfd-next branch.
>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
