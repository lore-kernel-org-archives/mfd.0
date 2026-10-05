Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A84D0CFB
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219224; cv=pass; b=OP0aSGaO3TehpKzFEvZsjJ7cJO45U6fjwulgJ/yEQ8j8rSJ1lq+Sfr5GpUH4wbHR4st/8+rHy5iPDRE3dof/tOmJCCvycgYq1T4AND7mLoDYmEUcymV+PtWBpm4aUAzQRbUe74iZc6R1BEUWQY++No9PIUwgKBkgT0qYfQIHH8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219224; c=relaxed/simple;
	bh=zSYpeV2P1QioqwAowluQEe3O60HHZwF3K/Julewq0kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AP1MHxVPhI4bvIGhXTOH2/nJjZrvU/INuEVkji9njikdyaE7fi+O7itQMVQBVfpOVkjF6kCnWuCu+wr361qHjpX72eAPQYRcmKyl7NfOkAYfAWREYalG9tjcJqX6zqrYH8YlgpocjnfhazCSnLJb0Yy04gPg54UCq7GWxBUJaA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myetAAsB; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myetAAsB"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso1211716eec.0
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 09:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219222; cv=none;
        d=google.com; s=arc-20260327;
        b=KtmFfsHR/nPmzIMOJE56WdFZq//hYJkSCDkR1hcjQGHo7l7LD/VY7/1O6R0xpDq7NH
         mlAdyAq6rf40lhVQNjbnkvfO4lyfaTOzzTFHd3slNeW9GmcU+5afDP/mUnUwtdY5+qX5
         XpotfY3h4C/0vdAb0ClYGt4yASQQN3y9xqDvm5ag0yyytHTS6qXDesesh5K4dUKJAwLL
         f0P4W9ikQ92U7sNcwZoW4NZFV5O+Fwt3bwgGgj7NQbWUXHgrw0Lh0LYpffFTf6ouEsFY
         6haXoZoNEb0JzXNTdDP5IKY5lPQWaRGudydrVnIs6bpB1dsBkyhYKYhFjuMseK18lewA
         EhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        fh=gjKEc1Va3hpDD+2X2ACWBz516MKZokrjXnWcpCrGuss=;
        b=q+ofKo8gftWrNWdMVrsKY3vCW+QyOZkvsiyBoO7BHljvCLm4ppsACCl2plvnfS3RX9
         mfWflwyztJn7hrYe+zk+erkQcyD4+EG8YwkZD27yviroaV9j/YNJhOPSEBc2r7C2YbaF
         zQpKz0CeimpUj/JQj6Rua38Fci+Xf0ciD1MOT+CehsXmwq9BG+M/2mqWhkYUvWYlzxrC
         dKhHKbxAsaAL0T25oahTnGn6kvrY4XM9laW3FSYZZpfJMeuhSV+1xMRZEIy/LmXoaTsf
         nwK0dgBwiA+hziJA/kz+VoJI5xc8BrhvF1C453MVH2zCpiI8OKoe+3e070YeATXrkTkx
         RLKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219222; x=1791824022; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=myetAAsBXyrUb3SZvMUDBVtNdcfLs5ya7qyO7XbaWDa6Hc6PAkF+uu9ele+LqNr0/c
         qUo3x+yUdyPJrG2LDj9Ie8hrK7xFY8HdfL7Rhzm0WV5YqCVyCNPKa16GhAjZZ7i8GEZt
         apuJVI3hl0oL27NBoXHkvOp74lOb51B3YRD6o+jk4EIKUaVm6NJEWJkqTj9xR4bKDczG
         reWafqUaSy8jPUuHy2O3SC+JuMhJEUCHHKu8WBTNkD+go6ZIgaoBjoGv85BGpESv6o1B
         603Gp2zVunu7Xwt4c2/WilUYuTNBvx7rgyvR5whu/MmMk3wWNtKmjpYPTOJPeiQUBeTS
         ULag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219222; x=1791824022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=kXntiyEXIzzk0z2tM5JT9rmyPFofw62ttyVFYTm3UJ6XtUugHNKY0TACN2TmAA3hMW
         U2aeIVIiVp/VexANVIQ22fJrRNbIUUx4+IRwHu8iGChpEVe+MN1Hnh2F6ZD0dhKJ6w/G
         6AMRZqiEelZBTx9RDMlep0x6nLZbVwXpSkp5xxBgfZ2zycjdCHtcZw3fpG/OZwtAOIEf
         4ReoJAhLL/MDFGEGNYqsv6KwrmCzuu5p3IgwKlrywYeFzLnch8Ni8vO43+PD9AFjli4L
         xQgpgkzXpnZPJKluTQaj37x2Ll8wnEDh42y7fX0S74bt3SsLI/M4RvpgPjbicmhwL3Xm
         7o1g==
X-Forwarded-Encrypted: i=1; AKwUvBxkxKmIuLr4GevzbrUHLjMH39XB3McO/qOIBxrYO0NU8c6SGkCw2p5Qx0KORDh71Ci67cM=@lists.linux.dev
X-Gm-Message-State: AFuF++nZBV3ZAOo+htEJKupk1Z8ZUrever6OufydRN1oQqIUy/E02qJ4
	KXkkUsSNHT+f5BwiZM4JsuGVUPultcUHewfYiAQZmuZiv23A0v99gmJemKDxFO/vV1JDQQBTtXv
	r4VNRq/nd0mU6atJOFSOaP58gSx3bJ/Y=
X-Gm-Gg: AYBFou2LjB1vzn7JDQl+XqlTVZ7cEQbZyrcVyKTEePwD+bt/p7qIOYs9dAkKQ8r1/pL
	EUJgjgTEBQqoK3p1QCBVxeRjPPT+AagQXMGvVHmEjGrZ+jVJPnw4BU+znYLLaMWlvlKhgmDGA+a
	abxIMttyFHtbiIJDLWQ55bFu7K6ehdhp3P8JmeMI1ze9Rr9EFkUO757JRfcAgBoCImPTbN+zchP
	oi5C2Rj+sq5K/neDsfBHUIJIeP/XPK+22NbjVelh1DsW4rP6EQuKPBJuYGH0t5+CRn0o9NDrHeN
	0xGnHSkEOmJy9aawaeVQmdBOlbvE4qsy/9wkkKZr9LMSsc7QdOkYgIrIT63m1VaMRig/N6X+PVQ
	0gEcFvt7WjsrW
X-Received: by 2002:a05:693c:8804:20b0:351:202c:c7a5 with SMTP id
 5a478bee46e88-351202cdc40mr6426669eec.0.1791219222183; Mon, 05 Oct 2026
 09:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-2-clamor95@gmail.com>
 <asPQ5FgHe87XQJBT@aspen.lan>
In-Reply-To: <asPQ5FgHe87XQJBT@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 Oct 2026 19:53:30 +0300
X-Gm-Features: AclHuK80gf8oQpP3oXOiwBy9nGlcatk2lN-QYD_5rDpDvRkaMQwRh_t86WEgBCw
Message-ID: <CAPVz0n1-v-AcKg8O66q074N3gOZQD1Z6k6O+ae6yJS_-NvT6UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:31=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:41:19PM +0300, Svyatoslav Ryhel wrote:
> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > new file mode 100644
> > index 0000000000000..014678616076f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > @@ -0,0 +1,127 @@
> > [snip]
> > +  backlight:
> > +    $ref: /schemas/leds/backlight/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: skyworks,aat2870-backlight
> > +
> > +      led-max-microamp:
> > +        minimum: 450
> > +        maximum: 27900
> > +        default: 450
> > +
> > +      max-brightness:
> > +        default: 255
>
> Should there be a min/max here as well?
>

Seems that you are correct. Thank you!

>
> Daniel.
