Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793567989;
	b=FXAgZpNmxeIfKJnUj0Vk9eSxXzt66hbJC0xz2GrnTxcGZoFElwUvzwulBsbLrFomgTFR
	 jLo+0Ug5QYOkGrAdgu2V5fNmi2l/owgNOrQEiwjJNrGwVIW1RB7AzI9HzCKv3p2VKmgll
	 AzbYrmH2IqjDciDlRrPNL+HY12VvJG0kWvXuhD0PEZnPE30uWfepThg6bHfG+ONoqLmtU
	 sMmrXiFL/lI++XYJvXIxCbUz+Fs439lDFJWt4pPPJTH7w0er+Vumg7NXhKlt/oGV6vrTL
	 dm1mNI7HN2aopJJSi8UhjzM2RezufUiGLMxQuCu64XlOQr3RfIIAvSDy0tzxzNfkFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793567989;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=og55u5n1Gdmul4ausS8JyuamV2xgkOuH347fjM0yp7w=;
	b=GJiohQdgvBtJSricEofUtddQtOHfevRXeM4LVht9e7qVo/oeKUaxSGABrPCle4STPF05
	 gI3XNsUFSJo909eYbxfNFFKbV30HrSVc70xtBHoUPwiPYAxDBjtdRss8aZvwFM7xei7St
	 qdiXf9f3gE/13AXTp86uoXPWfUna8NWPkf28m+h7cd+mIkI/z/OWirnqHNESs1Q4gvtQ6
	 LnSJHJHKi7x2FgI6RegL1wvUqueKSIefTkKhEMCrK5DhszA+elk+sW33K3qwh3+vZEQtu
	 smi2Y4s3KhmxZ84uD2RktyCthGksoVtnKK6ccMohHR1wXhhTcRZw7/Nz+N/unIsyFIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YywL5wq7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EA0606A325
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YywL5wq7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EA81F00A1E
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793567988;
	bh=og55u5n1Gdmul4ausS8JyuamV2xgkOuH347fjM0yp7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YywL5wq7YoRgBo0wqKFw5cxBW9i7ZWpgqdFhBBeh3ttths0AddZtuwFw6zHS2KNmj
	 r+8qOvUt8UqhKgoX7TijG9rSW8jKSMsSqhAINGtRy48wgj9aeZvV2tXiX9OEAGamoB
	 8+ibqcGfJvRzuS2FW8yb/ezHbrJitsDSbVz6eYgdpr9OlmJU4otkylCuUwe9NFSYpX
	 gGxZqyWjNdi74GiWdGVtZyM46GzOAsaBvcMBUliBQx23ypdldJMdg6wSBwMZY/pyMF
	 OseIRvv8hKno+pMVugCipuaV/AVxP9mR+vvi/91lOsFj3DJNK/gNL72t/xIsqe098q
	 JxybrAyuDCG2Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso29108651fa.0
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 13:19:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxPH6e6J+Z+wyAzKbUxzgwq7fQ97tFsgSXcGyxaPxbvIB1I8Ajb2CTcFip2nyEeGrFXii0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8o2rYoeCFjDDd1W9RuCVmmxku0l9AzUuHvCpTO+Zx8HoizLeXj
	F9vjji5A3L8rqlWZI7VEet1sZSttqKl/ZVvIJOSBqLcKPiFVX7urr/Gkoa/Q7+5E6JRh7fedhBz
	7MURSc/gjfdNwjibt6csm/WokRHMVPuM=
X-Received: by 2002:a05:651c:1b8c:b0:3a9:d111:6520 with SMTP id
 38308e7fff4ca-3aca55f2846mr26417331fa.0.1793567987240; Sun, 01 Nov 2026
 13:19:47 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org> <90c5efa22600044657e67b9e1297bda2fb53f60c.camel@pengutronix.de>
In-Reply-To: <90c5efa22600044657e67b9e1297bda2fb53f60c.camel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 1 Nov 2026 22:19:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL==hUSGDryCDuoQrfh=s+ZnRojVcuhneMGWFvkSNePbMw@mail.gmail.com>
X-Gm-Features: AclHuK9qYHSbdW0qFPKPlvZIS7KY8pzu0qIZa_AZ9GRrGb6SLD_bdgD5vQv0EP0
Message-ID: <CAD++jL==hUSGDryCDuoQrfh=s+ZnRojVcuhneMGWFvkSNePbMw@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] reset: Add BCMBCA block resets through the PMB
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

addressing comments before reposting the patches.

On Wed, Oct 14, 2026 at 1:14=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:

> > +struct bcmbca_pmb_reset_group {
> > +     const char *name;
> > +     int (*reset)(struct bcmbca_pmb_reset *rst,
> > +                  const struct bcmbca_pmb_reset_group *group);
>
> What is the point of this indirection?
>
> There is only a single array of struct bcmbca_pmb_reset_group and all
> entries use the same bcmbca_pmb_reset_sequence().

No... one of them use bcm6846_xrdp_reset() instead?

> > +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> > +                                  const struct bcmbca_pmb_reset_group =
*group);
> > +
> > +static const struct bcmbca_pmb_reset_block bcm6846_xrdp_resets[] =3D {
> > +     /* Keep the XRDP bus interfaces out of reset. */
>
> What does this comment refer to? assert_value being GENMASK(2, 0)
> instead of 0?

Indeed. I fixed up the comment so it's clear what is going on.



> > +     {
> > +             .bus =3D 1,
> > +             .device =3D 12,
> > +             .offset =3D 5,
> > +             .mask =3D GENMASK(27, 0),
> > +             .assert_value =3D GENMASK(2, 0),
> > +             .deassert_value =3D GENMASK(27, 0),
>
> Are the four different devices the packet engine and the tree runner
> cores mentioned in the dt-bindings patch?

Yes.

> Do the 28 bits refer to 28 different resets?

The only driver I have writes 0x0fffffff to all four registers
to release the resets, and this being Broadcom that means
that is also the only documentation.(I don't work for them,
my mission here is to have a working platform.) I could of course
experiment with different values but that turns out to
be more of a hardware safari, I made it like this because
I don't want to fix something that's not broken.

> > +/* Bits 6 and 7 select the lane configuration and must remain unchange=
d. */
> > +static const struct bcmbca_pmb_reset_block bcm6846_pcie_resets[] =3D {
> > +     {
> > +             .bus =3D 0,
> > +             .device =3D 18,
> > +             .offset =3D 5,
> > +             .mask =3D GENMASK(5, 0),
> > +             .assert_value =3D GENMASK(5, 0),
>
> Same here, are these 6 different resets? Does the hardware require them
> to be asserted/deasserted at the same time?

Same here, this is what the Broadcom driver does. If you insist,
we can do hardware safari, but there are no docs or other examples.

When I look closer at the PCIe support it has some more weird
sequencing going on, so I'll drop PCIe support from the patch
series for now.

> > +     },
> > +     {
> > +             .bus =3D 0,
> > +             .device =3D 19,
> > +             .offset =3D 5,
> > +             .mask =3D GENMASK(5, 0),
> > +             .assert_value =3D GENMASK(5, 0),
> > +     },
> > +};
>
> Why put these in an array?

Right there is just two of them. Individual taste I assume,
I dropped these anyway.

> > +/* Best effort with both locks held; never restart a partially reset g=
roup. */
> > +static void bcmbca_pmb_reset_cleanup(struct bcmbca_pmb_reset *rst,
> > +                                  const struct bcmbca_pmb_reset_group =
*group)
> > +{
> > +     const struct bcmbca_pmb_reset_block *block;
> > +     unsigned int i;
> > +     u32 value;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < group->num_blocks; i++) {
> > +             block =3D &group->blocks[i];
> > +             ret =3D bcmbca_pmb_read(rst->pmb, block->bus, block->devi=
ce,
> > +                                   block->offset, &value);
> > +             if (!ret) {
> > +                     value &=3D ~block->mask;
> > +                     value |=3D block->assert_value;
> > +                     ret =3D bcmbca_pmb_write(rst->pmb, block->bus, bl=
ock->device,
> > +                                            block->offset, value);
> > +             }
>
> Could the PMB bus driver provide an _update_bits() function for these
> read-modify-write sequences? It is the one handling the locking anyway.
>
> This whole driver feels a bit like if PMB could just export a regmap,
> it would collapse into a few regmap_multi_reg_write()s.

You're damn right about that.

I will rinse and repeat.

>
> > +             if (ret)
> > +                     dev_err(rst->rcdev.dev,
> > +                             "failed to hold PMB bus %u device %u in r=
eset: %d\n",
> > +                             block->bus, block->device, ret);
> > +     }
> > +}
> > +
> > +/* Called with both PMB locks held, including during error cleanup. */
>
> Which two locks are "both"? pmb->lock mutex and the PMB_MUTEX hardware
> lock?

Fixed with regmap abstraction!

> > +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> > +                                  const struct bcmbca_pmb_reset_group =
*group)
> > +{
> > +     const struct bcmbca_pmb_reset_block *block;
> > +     unsigned int i;
> > +     u32 value;
> > +     int ret, pass;
> > +
> > +     if (!group->num_blocks)
> > +             return -EINVAL;
> > +
> > +     /* Assert every block before releasing any of them. */
> > +     for (pass =3D 0; pass < 2; pass++) {
>
> Maybe   for (pass =3D PASS_ASSERT; pass <=3D PASS_DEASSERT

OK I'll take a stab and see how it looks.

> > +             for (i =3D 0; i < group->num_blocks; i++) {
> > +                     block =3D &group->blocks[i];
> > +                     ret =3D bcmbca_pmb_read(rst->pmb, block->bus, blo=
ck->device,
> > +                                           block->offset, &value);
> > +                     if (ret)
> > +                             goto release;
> > +                     value &=3D ~block->mask;
> > +                     value |=3D pass ? block->deassert_value : block->=
assert_value;
> > +                     ret =3D bcmbca_pmb_write(rst->pmb, block->bus, bl=
ock->device,
> > +                                            block->offset, value);
> > +                     if (ret)
> > +                             goto release;
> > +             }
> > +             if (!pass && group->assert_us)
> > +                     usleep_range(group->assert_us, group->assert_us *=
 2);
>
> Is that assertion delay the time the reset needs to stay asserted or is
> this really a delay that needs to be observed between successive
> assertions in a group?

The former. I will rename the variable and add a comment so
this is clear.

> > +release:
> > +     if (ret) {
> > +             dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u devic=
e %u: %d\n",
> > +                     group->name, pass ? "release" : "assert",
>
> Please use "deassert" to avoid possible confusion with the
> reset_control_release() meaning of "release".

OK

Yours,
Linus Walleij
