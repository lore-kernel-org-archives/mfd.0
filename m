Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D3442B12
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062218; cv=pass; b=tISeDfMBEa51ORycmcVadaIx1ki4k3v8TMpZRD8NsaCagA1SHvDcTy60mdp8iAu17/4ZLQp0Erx+MBuF/c9ESZUEIQ2PopY+DNsR1Nj5M2ztQAQy5sG4f+URBVIn4KQGo0nmorTeZ/epukG0gDrP4s2VPqIzm0CNTnTFubi1KgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062218; c=relaxed/simple;
	bh=ftrznCscSqPlpj0id6UlQ+EeCoZdkszgo291RJdPy9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CU6iS61fMHOKGPExXboAf2VIN9vB8FGqCP6SDeL+Ieq4V+xfeoGzlI+Lmxz9wi9o6zACLM+pkQ1nSkZhKdsCqelTJtrclv7cPl8P6yH1tY51/4jjNwcsQ+T1vfE6+2s5JNTe0ntR29BOClC41O+XQ1DVGYOPOz/zXV+m0DUU+Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeXL3c4K; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeXL3c4K"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a18d89e4d9so672360a12.2
        for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 07:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787062214; cv=none;
        d=google.com; s=arc-20260327;
        b=hQ3mxkJzc9d5GJ4ZxsVUkxYfFq2B136zZ7M3R2epMzIiS3E8X8rPWOYWu6O3XNlHuR
         1db/m1dWKqnbVriodjqD3Uwmlqp/Ye+mxt9Eu0HDSshLdamwLFOKesk6SahcaOb9DxO6
         djepjdeK30ovpjM6dKjrHDM7aVy84H1eyyLNojzBXlARz+BM5FTU1oLVSiZc0zpj2DdD
         VyNYNqCk/2ikxTH7efVr/hNC7Q9PDPxjyckGsCNMCsE/foVK4WYNeDG9RDJ3Mf2Xrdv9
         ffhwgsY/4317MYuG0ChBTReFXal+IpaKGS3GKaf1lgsWsWoP2bgYoUe1H3AW1RcJ5RcC
         yHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        fh=VS7GEb4KtIkNUjNw17o/+i1Y8iiAL5C9ZfA28A+UFlI=;
        b=axJio0QHMn7sTlklHYc5wKUZTid7WGQEAY1nF1BEFXtAW/vPOhy1zol1JKKtWbpUhc
         ZsizDYf+dddKpyFwH6zgg49koG9TCbXhf0XLv/O8J9hgm7ZT4Dx5SBZXOypxQo31J8AC
         MiF7q0fdz5dMqmmxDR5ODJnpR1JkLS+zK8ipagcA/fPdk6cIZtUpoxEo1u1O/xcY+FWy
         CUo0cv8+2gbEpL5qimSsCkFbfdrnQVwbQbmHQ8gGl/ryoRn1Ux1380sTKO7YZ9s5yDgu
         gB+YnH9iKoonCobyqmMgoxQjvvzlhpgxdFv8tZyl1FirSYeFIt14NeLpC6gfglJkvM0Y
         tE0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787062214; x=1787667014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        b=AeXL3c4Kry5nGOkDhPHUAWBngvPx0cPm+Lxg79Z4gdqbKpTV5YjduPMkBQtReqY3FD
         omedxtCEQGjcDfdJprQ7LVTZLRPR40IRJmXuR0KDH8Ps4dqb+XOhSVonE7A+BDwLZewg
         VYBDb9UpwvRECPLaJ8Q090uiuAgzsSx1KxzaXLb6vgMAzsi7/+YFga77MTI5K2kxTqJD
         4M2kjsllufVgtbllrscX4hQSZtEi2BVlJd+sgLKbi693Orf9HWDzOdL2mDDlwgyVF6XN
         RM6UXi3YEO1akg5l4PE6m+ZmmM0lvFS+hcD0ooim0Nx/wh4+PRFhcTzeEqJCA7VAE8yG
         D3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787062214; x=1787667014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        b=HSBWoeVwZj1aJbaYGUTT3vF2Vyi89H6+btHDb9gheMw00drD9C1WsYQhIRTkgpaXtw
         Htg1X1ZCh1vecDtPe8w18+FhHI7bpRy+hkSof8cDUmTm0OfbLO+AFAJSwrlFXErVCGwL
         qOUYvvh89zYLIAS6xC60qzgoi5GoaPA9YJ0nafHOp6zN8VE0g36i9QxhsaMCxbEn+Vx/
         3qRBRGj0csURjF4O0GU5xsCTUjqTto8dntmobALOgYprJZrtLuP7iIVxqfjVpA6GiWTk
         7J5S1exv/tIyFqt6FDL9+CcZVcRJ3UYi4rxWEnzw1dpGsJL7DvxWchvUZzzwpUrwcljd
         mzrA==
X-Forwarded-Encrypted: i=1; AHgh+RobLj4Ar0f7ftuARTDx6XES0ypalvNHC+PMGsF6ncV9pvhyk5f2UG9JQHJv2sWFvj6XYcY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjHYforPqSU6TDV4OLVqp+bzA9pveDciD1VpogYyFi8iggMkwf
	vsFFx6SLPO7BlZCpbRXEPuAhFxMY9yfzm+BOIVqiyAL/wKQYCq2jkm2DLCtCSAaMK1VeKk+2HUq
	vFGQCR9lTLuzZdzRVG6QnXwxTWq/cy0o=
X-Gm-Gg: AR+sD10Or9sIwwRw7mM6RJ2F/K+mxAIo3yHO4TNjcbxpLj/dSh/j67rn7ggLTJON7Wb
	JEL648ZRQExahRZAElE0xfrqY893kbQqrHXexjIteqT8pr5kMuKt7IWCvHbwT7rArIRLNVaCltK
	kpUkKbwRSYS98LH2J0iHBSwT2ErFuCklQtu3L+9KFqjDUQEtTH2vA71m/zXqxwPRY0ru8kMTXv8
	QY3Ak39n2+EYGTh4vxuMMA7yXDerAesXigDL2lEQKBrGzuEHxXLsaLZD7GjR8g1N2QexhUTAl//
	rUm2Mb0IJemeTXXOimPZlL3yN7mswwaMOa0vX4wWUSGC6LcsqFWHJtiqRGA51vHaWqHG5v3GNJF
	AYR+Km0DSiehJtA==
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id
 4fb4d7f45d1cf-6a38a8b7c62mr9115636a12.1.1787062214328; Tue, 18 Aug 2026
 07:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com> <20260818-convivial-manatee-of-jest-acd3f6@quoll>
In-Reply-To: <20260818-convivial-manatee-of-jest-acd3f6@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:40:02 +0530
X-Gm-Features: AcwNN1VkFAcXdnV8Yz--n3a3WkMmue2uYHuue9khptiKYSaOQgn4dqIhHktkVKs
Message-ID: <CAOWyW_4BrU+BO+KQjH1M525+0y6_YOa2C_3sjrxPzzgT46aNJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 18, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Aug 16, 2026 at 12:23:00AM +0530, Bhargav Joshi wrote:
> > Convert the Texas Instruments Keystone Device State Control binding fro=
m
> > legacy text format to DT schema.
> >
> > During the conversion, the following updates were made:
> > - Add "simple-mfd" to compatibles matching existing dts usage.
> > - Add required bus properties #address-cells, #size-cells, and ranges
> >   which were missing in text binding.
> > - Document child nodes gpio, interrupt-controller, and reset-controller=
.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> > Note: Running dt_binding_check on patch will yield a warning for
> > 'ti,keystone-reset' in the example block. The YAML conversion patch for
> > that child node is already in progress here:
> > https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-=
1-189389503324@gmail.com/
> > ---
>
> You need to send dependencies together, either in patchset or even one
> patch, depending on the case. If this has warnings then it cannot be
> applied.
Yes, but ti,keystone-reset is now already merged into linux-next, so i can
wait until it is merged into mainline then resend the patch without warning=
.

Best regards,
Bhargav
