Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F64C418360
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233259; cv=none; b=VYVJqxxTuSaEXWsRhWCCW6ug0xmZcP/6awD36IC/L5gdIQjOhfnDA+yy5klrPwUsLJ0gadKxzkx2lgsEzLkqtELOuSm7zV0Y36d6dXIUH3d08Imtkgi/ud/ttai5EAV3uEwFdjn7IiVNh/QsENt1nduSyfB2CN6O3Y6RkWg3lP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233259; c=relaxed/simple;
	bh=xfiTe8a3oGskPyDZaOXiPoFJX6+G+Uti0Ha7xnoWf6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/tnrwGDoZxREMgVUAoyrPDDOIvmhXVmrsxqBbVEGoApxz4J4EULwIxDh+/ZWVKjwS5a1AdRpF6/1lAl0FAuNmwFv8zcYJrdYVI3Cojg9n6Dj3hQ4COZWCrm7UpJOFV65aBHaq+uIUP9JGIFBLnTjMjvA9wvERxfmquOgEzZzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNeXuuj+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNeXuuj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2319E1F00893
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790233243;
	bh=6ffqPgw/LcFO1CQ0ieSCT06YxmqsxpSpEHvtKUaBCIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jNeXuuj+7BsaiQRTJ9d5UjRS1RRwScMKZznMvrAO2GVkuWiCzpuzJCPx4jEMzfJJk
	 R0hNeRGqRiGhAjAlIeg4jvyjKokWbrnznTWHoAOBk8IsynHQO5P2BXhZFYoKURkjOo
	 9bhsvtl9cPeBzlie4kBoFtlibC1bf3lrRMdDvPmRIrMC6zrrP3LBeamMiIxHxron1Y
	 HsUoIlSMI3w0WX9QPTal0E2lg0U9cG9Zf3658WiQiA3K21SekMWNCzJAbV2FA2niPY
	 BJOajVTWbFx0eAVgrVGpJQSsOMqR/B05jPE0MoKTMf3aOwrTDvp1qK8uHnQfeYX1tF
	 EKW7gv4SSb69g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d6489419so1485362e87.3
        for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 00:00:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygHuUh08Pm2xIL65yaQcm5HOHlq5At+cnEyQfnMH9jRWjLXYidAIdrihs1x1wN3yRNV4I=@lists.linux.dev
X-Gm-Message-State: AFuF++kyQ/JayLUOtxpG5Lj3ji/umFONjw/kC0hze+a50KA5aluQzbFJ
	E7gHpt4R5+2GqG/bOkQ1mUSw+QA1UVPRFYQlY+9ZHEicEzxONIxzC9WD0e4HN+udG78+WS1eWwb
	5LD6sKan12adnNHfIRmwjWmSWMzF+8A4=
X-Received: by 2002:a05:6512:a87:b0:5b6:1783:e2c2 with SMTP id
 2adb3069b0e04-5b8df049eeamr470391e87.13.1790233241891; Thu, 24 Sep 2026
 00:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
 <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com> <20260924065449.GN3864833@google.com>
In-Reply-To: <20260924065449.GN3864833@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 09:00:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
X-Gm-Features: AclHuK8gBS36DLYKHu3jmsHYMRk4tYeVzSqWdkiCjihTyWef4X6vqS1VxUHzHWM
Message-ID: <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:54=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:

> On Wed, 23 Sep 2026, Linus Walleij wrote:
> > On Fri, Sep 18, 2026 at 12:51=E2=80=AFAM Linus Walleij <linusw@kernel.o=
rg> wrote:
> >
> > > Describe each MSP as a single-DAI provider and the AB8500 codec as a
> > > two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
> > > and select the codec playback or capture interface by port number.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> >
> > Assuming Lee will apply the ACKed binding patch so I applied this and
> > the rest of the DTS patches to the ux500 DTS branch for v7.4.
>
> Right, but it's not Acked yet, is it?  Or did I miss something?

It was ACKed under a different Subject: so I resent the patch
for clarity, sorry for the mess.

Yours,
Linus Walleij
