Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147CB4E06F3
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168049; cv=pass; b=hdUBI2HYyNvL81/YUxGzFDu5MLVQmZpFTNIdvsDSkJU3Cj+dGd/HciHZxMiuKl3ThR1Vu2DsGI4Xx+GjX2CSwK9CdrX2MD3A3L6TycimeFGfUM5UlrYlLhmg1YEbkIebL5NgpzW4FO6LheEuJuLIU8ZsVFIrJpF39BnD2dpZeoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168049; c=relaxed/simple;
	bh=7EREj28Pt4d+3/OFjKBkGafNy9R17eDiUOr72tTJcIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1YuwM23vp889Q/lSbZqywL9mlHGrhfl0V9fkOSK/bpuNmLSKU2JT1Rw3s1B+MtVDk/MQkw6L3+JT7DtJVIpND/SeM6PYbHkPRAa2z7nZH31y2rH7jAdluDAT/jO7IfuzL7PSsyYlh69qv/zg2LPa/3N+MQzJOZYTJjdB7Q6yqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esvFYAQy; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esvFYAQy"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so69691eec.0
        for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168044; cv=none;
        d=google.com; s=arc-20260327;
        b=GWe7QYcaD2oFQV9s2Q7Ynd2RaumClIbDjJyEXd0nteI/Kafll7nAXP622plD5fkTtj
         nFw8dIXl5OdtAXZNYFZkmVEcQeaH35mJjrHJDXx3bL7FiJVJes2dlYl7dL/HUfSRzH2K
         NMkLKRIln0MrD2ftmYBX4LnNB5Uq7I1OdghgqHgUwlIY4ySfvSe8OOFBr6J9Uk4TvzvZ
         rKyQC/GlCXA0gYjrtEDr0hx/+VwXPQm05q/Cx3CdjOV5lmkUQt4HLSAoiHMLY4mJS7M6
         4hNXfHE0fYCQ6zsa+0LFbXbtKUEfifFomg7WvOSQjRJiUPtRyS8PdVi/ByjoiqJ4b/b3
         ulsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        fh=7uCrcaSsW+KlIBy8+V84oHbdjJD9TzY3rLCaBxUgkLo=;
        b=fQXqKa6aLblImcNvsHZj+GlBXt3BBEVE1tkFdX1EIA5eFILMOw4AyYQsLYr9ouSmTf
         CJidJsrWhBZX4O0aSfUp816mJKwtxvGgreImVA6r5kVDFfCDnerCXlz116kefyD87DBo
         vjyLZoe8Zy1Fk7YwkVhBmp+mDiR9nX4lLgRMz0zQkBcXjbRBwm9+tMBV0wk+9L1+rEKS
         2WFm3/EBTCpyJ/+cVNcNYB+zeOiyztt4sv4KcsCAWqeLwvvsmnxfOTlVIgOw2YDgQeBw
         6QpR1yt0yyJQ+oaygTTPiX9RX0zjQASSg7enS3hf6le0hvlbkQy/s1y4pJtldPkgoXv2
         72Ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168044; x=1792772844; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=esvFYAQyul4T7tzzRcRVXhFhhWPtNxnz6NlpsHqprEaUDXUWq6FFq4bG09Vt9hgPc0
         fM+xi49HP4x7pfm+6+FRXRdm8OSYkQje7BoUAU8ya3DWglZJSyH16RTeD27AaYI2wSjX
         zJ9ft6qlGnYFpFUz6kAiR6Yekvxkls/rIyHRp6c+dC/ELfHgHZqjdyBpxH7LMEq9xiY2
         iWgMTZMQ3A1XmUaIVkOnEFFzfqx3pDW/GhlFAhV2lbGgOvodZp3bSL/v6pL4FoLt73lv
         KPq/YNmzalGv8EkKr3jp3ctFPWG5Lpwt3JIJZzf+1Ow08dahylXus7sEs0Dyg9V5C4f0
         id7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168044; x=1792772844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=Z8JFg7+f07WYHISOKVlFgy2MI5RDR/SXafPxwHVqNuqzQc2pGX/1I1DtMebUb17sR9
         orXyvX+D9cAfzofZ6qN1rAiDkVjBF/XHYoyeRfFILCTo06d4gL809ahMScG2L2xEj+50
         D+Qs+SkBEefLrhuP8B/TwHjA+EVy3R5auVitmNsiNgI2djPO4q6hAtby47xM9k5lIooO
         2pK/ED2DACPppYuo2SBccNBHb1juE5NjiwutPowXE2nRj3AMaHUhuVMVA8zntWcnZUi0
         V3ml6YbNDkKgF9IojC4FR+8XoV5cC7rsAXqH1cUrAlp+VzoULshUE9wMVsnoFaBd5TsV
         Y6KQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7AiJqjv1rd/UNklev8EudrPYjg24apejDF5vSTK3HUu3J/AT95HNDVv5ZvLhe+PoIXWg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+i94UBCAm+XUOM4FKVp9K5xKzu1zxuwXZkufKc8v98lI8eP+i
	EPV60r/MRaHNPDLQS4LD0c0FY2KhTZJ6NpyTEFAqw4Sn1v4oNiNm4gDFp7ZpRzcpfJNdkzouU2J
	Yk+uJer8VwwRn70mBP0IifMpWoEL+mZc=
X-Gm-Gg: AYBFou1If8SSUo1yeG/RBmZT7e84vfR93xUku5DEbCpdtgLyNuC6UryQ09SMHBLyANb
	1+dkCfXnFzjAMzkbEsJjLf7FVo0ALbWfYJIWdX4lsppwIyiPBKklwocwcWy7kH+ekaHBho55ZqE
	DHO1s73QABUPh73VykNqcAfO000u8B8lQNk16SjGfzjtVqgv3dI/UvtKKddqgItzLs2A6ITYWAq
	0Vl4tXdTRr3CHThH97/Z1GI2DuZI+gaNLUzHaeGDs/YIbPuf2PEguYKSgvsWXdKtg7FT4a47pTM
	5bDbQBbW+A1IOKnIx0T+DLVPhJ6uVv4JUCp+74ZF/Iz17SpVtP+aLCM8ZddWRmubI8ettML2+iI
	QdhhdT6pWLo43
X-Received: by 2002:a05:693c:638d:20b0:35b:cb8a:8d0e with SMTP id
 5a478bee46e88-361a18634c7mr341911eec.16.1792168043963; Fri, 16 Oct 2026
 09:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <atJDFRXmgZ37GrCE@aspen.lan>
In-Reply-To: <atJDFRXmgZ37GrCE@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 16 Oct 2026 19:27:10 +0300
X-Gm-Features: AclHuK965ULDwrtLzaPZLgAMgTCNPq5g0it--pZ3MwPKJFECiLPJTV2LEV8Gatw
Message-ID: <CAPVz0n1RVDz0MsMBccanpynh=Qn4x6Ar7rXRUVitav88i-hWYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 16 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:3=
0 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:09:31PM +0300, Svyatoslav Ryhel wrote:
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
>
> I think this could be spelled "else" ;-)
>
> However, other than this this looks good. With that change applied:
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>

Patch cuts part of code, this is the full context

if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
        dev_err(&bd->dev, "invalid brightness, %d\n", brightness);
        return -EINVAL;
}

if (brightness) {
        ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
        if (ret < 0)
                return ret;
}

if (brightness =3D=3D 0) {
        ret =3D aat2870_bl_disable(aat2870_bl);
        if (ret < 0)
                return ret;
} else if (aat2870_bl->brightness =3D=3D 0) {
        ret =3D aat2870_bl_enable(aat2870_bl);
        if (ret < 0)
                return ret;
}

aat2870 cannot read main backlight register nor channel enable
register to check prev backlight status. Hence this logic is used. If
new brightness > 0, update main bl register; if brightness =3D=3D 0,
disable all active channels, if it was 0 and now is >0 enable
supported channels.

>
> Daniel
