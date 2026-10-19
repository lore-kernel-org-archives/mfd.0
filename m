Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7B604047
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418601; cv=none; b=lnle0AnUpedbfvxDrDk5qWTkRPa3j78MgENIMTZlQawy+VkafK1neIrKAUlsvl5o7+jCRuy0gJemLxW4DwpkjgE0iXWkuOCR5FtJnUZz3I3wyGTak0wXcq0k5THUH9nhNzthjmgBk8Mb/Pkz+uF2H4nguzFIkAzZT22+9E1T1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418601; c=relaxed/simple;
	bh=8N7M03OaTh61dQid1CdVCs1IXyRUsjhkJaKyLSnBGUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2COJzBNzptJSy3Azbvgu8MBYHVmtQa9Tf2GzB1XNiu6nUgSJ2QIVaPRgTHCmAMhM/g4NIWB8CO4B0Ahs/dTgh0iolRN7blYuWTBp/CHGLUe7Yb/G1fJuZYFShzK5xQ4ZbTu3Lgk/XgvXqw6DF56HuqsSpecMQtUwpl/2nTP4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXnyMGRA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXnyMGRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17F01F000CB
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418598;
	bh=xfgYFNTqOYa8NAxPLZPVhWUvOB20sAQXRAOszr0q/VQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jXnyMGRAlDjr6zRCDBdzkvoeuKZgCnmWpbL1kiPytyJlyP1LbZi/Utp1jHgWqbkFH
	 KxaSejYZbUSYs/WRpkVn2MjWkQ34tZzi3Pxqh2UmUUjXzt4dPYrWMIaOhHBxBr9Yle
	 pLc5YXgcKOh1i+xgDvhbi7CQMsiM3P66qmOZ4r+/UVwmylegOdz0iTvNzjOts1HUqe
	 D2vpVVYqHSsyiEqycblNxq4HPwCp4eXK/HrE/8bx1I/Wjmqk0CN4d8icxlcwycv3g9
	 5dfOKn+jX+l9lFtr7Vxem2zizx7cNvjOffMr3dPeeEfbtiIRms34Q0xAhhzt0Gvyui
	 FCMz2oQ9TfxeQ==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48eee44b908so1117223fac.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:03:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0S8xHMbsdw6LIvBrp+eXaLiUN6NBzXVesJtuL3F4Iq1ZMI9hXBH5fwuLVlzzN48SAJDA=@lists.linux.dev
X-Gm-Message-State: AFq9FYI5/EuDATFwGwulOhWBJ7Ibuy9xiuW4CH3/1urDJgLlLvZdhhgC
	D6cTIcIMUKk+xuTRNbwytxI1Q0FF4KtF6Ujv15f7J4RccaRN3mm63c/Lq403H1QTNERgH6DPtK7
	k9MmsMJ41RSwSKtQI1GDQyhtw9ZbxrAY=
X-Received: by 2002:a05:6871:2e89:b0:48f:e0e5:a1e8 with SMTP id
 586e51a60fabf-4a757a1408amr5342765fac.45.1792418598137; Mon, 19 Oct 2026
 07:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org> <9ee8a8f1-5e32-4ecc-80dd-027f0424fda4@kernel.org>
In-Reply-To: <9ee8a8f1-5e32-4ecc-80dd-027f0424fda4@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Oct 2026 16:03:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_FhbjBCAZKTa_sBLT6UX+xL4kaHmTCE5GAOJf__2tnQ@mail.gmail.com>
X-Gm-Features: AclHuK-CrXHR_ECn6jU2pZ0tG1afGY2U1A37vPXP2XK7b3-I69SZV02e8oV3Oa4
Message-ID: <CAD++jL=_FhbjBCAZKTa_sBLT6UX+xL4kaHmTCE5GAOJf__2tnQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> > +    /* Called PMB Processor Monitor Bus in vendor tree */
> > +    bus@ffb20100 {
> > +        compatible =3D "brcm,bcm6846-pmb";
> > +        reg =3D <0xffb20100 0x200>;
> > +
> > +        reset-controller {
> > +            compatible =3D "brcm,bcm6846-pmb-reset";
> > +            #reset-cells =3D <1>;
>
> Anyway this tells - no resources here. This must be part of the parent
> node, not a separate device.

It so happens that this bus (PMB) has several children just not defined
in this series. (thermal, clocks, power domains).

One of the children is the thermal monitor, which in turn is using a
reset from the reset-controller node, to reset just that hardware
which is under the PMB.

At this point if we put both #reset-cells and #thernal-sensor-cells
in the same PMB root node, the reset resource would come from
one part of the PMB to another part.

They really are different devices under PMB bus, but I'll just go
and implement thermal sensing in the same patch series so
that it becomes obvious what is going on, why not.

Yours,
Linus Walleij
