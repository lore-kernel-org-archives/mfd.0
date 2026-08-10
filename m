Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AE36F900
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358215; cv=pass; b=o6VFgAnm1a6r+U1kp6T/TazLlCed8T/EiFoHQNDOmqQDBOxcoSYXzJPRyRrS7ZNaBVKwQazsSUyNmKYD+eMecoCVhu7c1LPQQPY3Bj/W8lp+PNmndegoEYlWEhZp4GS8s9cTw/CDsPnXFWnbEPWxiTxoS1Ov4PBQ23wYu6x8NOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358215; c=relaxed/simple;
	bh=EoJjq+T7VyGPNATN8SO5bqxvJfuZRwCFmI4lyyJXJ0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF4L9YSL/STIFM6dve6STR/X+7tuXrQwg7BBo/mO+D95UGLYzBk19A7JnNYeZQYLFGeVn5xF51TFyF5r90Vp40tex+sJjseEVjU86kvmjkOT2I5ejtBNRi006TY5WY02Ly4aRaqFkFhUPfyghnKfsCOpT9KtYj7jYrgxgVBjcaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=PM7OC3r7; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="PM7OC3r7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so968321f8f.1
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 03:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358212; cv=none;
        d=google.com; s=arc-20260327;
        b=l3y0inCrv7FLQUsz0ScFs91C2rFgFheX5FwAJYhl7SJFWvikHQhYZ+8tATMe76Nhgl
         dJlOkHhei8bqskx3M1Q9xwXCyKviq2SQAlRTPg6591Hip4usEA2ogdAr80+2W0PnlLc+
         N45GEpnOIda5ElEFvh1VoBJVvZdWOwfkFfaCpY5EshOqPkQZxA671d9Z/8RdnEWLmAkV
         HYefQhTBCi9IgFnoxmsJXdsR6PHs9/RKTnmen4B2uYjh+zI60MgBW0kjExi+UBOCd/L6
         FOQkNMtCyEx0Hw4vQ3JUsseHwDcf3DoIkFNPkYb4SKT7unpWOu+ivAZ0nhrhXJB4hZwi
         vHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        fh=EkRRwwtyQL9e/fjDewNs0Lo2zR5l+ArXkvBqVjHuHQY=;
        b=O5dK0mddlo3iO8eKqJoHDFHn7jYxyElUl2eIpz2ngd8X2yZciKwIg32wBKr7cnKmDt
         +Y6RjbZRggDVGby4kP37xTpGVY6P6t6Ud2Xs3MltHb3+vVeP2FFd5fULATa0EZ9ab3Hf
         fRuHhQDl6q5MfSz8BD8ISGow0Ry2J5bSkB7Rex8qXZKgQknwXEaIa3w9UG0Kxln8yi2C
         kff9AdoeLfTba3sqjui+paZw67nZWWMsQy3y8Mu0ADqU8cFYxXFt5zsSFHjE1QgC4C6P
         f9ZR+Qt/89ocZxkhzRHbJd6Si+XGSDJe1BeaRGjFKme7x4HBGASIwcQYgkNW/S8BKUzV
         2rdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786358212; x=1786963012; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        b=PM7OC3r76fnAlQV9DsBP0su7dUHWIyQOvFQBuRmYhnTotCqP4vmwUvmiL/6A+1cEOP
         1h35gvK28ey3vn1y5OuCyTebH3ySNLSsHEE1rlGzJutLnMziPsTqnka+dJa6R4+tDrjC
         ajZlC6U52CoQKAT/gyW6D1hGTVkyXgosA73bsSsVREO9qPomjGe3O7ZGpemF7Bjz1AaQ
         e3v9qRMUHTSYzS9K+AhJ+UPVMs+wjvPx2+CmVWMVXSCevdsVndSGkysQcCZd+2XZ687n
         nYCapvSPq06IY0fWQHiYDRE/CEiCafExSgAcU+iqD8uduxk/fpo4EnoLfnvKII/o8wpx
         yNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358212; x=1786963012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        b=rwJriyTkzILzv6MjENYMJcTD6ea8L0r5Jc/r7tJFCpygqCA+KY885fppXGspuWe6IZ
         1HFLQ5r8xv1Fu/pOyZvbhig9mbjKmufIcRaShzTgWO0wSuy+L8Nc4INJ3ZfxUWaHDdOH
         Mo63W2tvwE7a/49FjzIz7LDn0t2QvRDlrqNjFriH/rLYO83fPN+DHt+mCxSUf66qNOmH
         VHR6FJ0hCHzGbt7IxYodgSJm26zWDywgS6TRxOcb8LmA4837WjWKVaXXd2vcU8hW/nQR
         FQv31mR2C2f8xCU7Dg6ZvKUXZ8pxQOJwI3ixVjZv6xaZt+FZ3+FE/oziuENrB5fHY4/t
         NPew==
X-Forwarded-Encrypted: i=1; AHgh+RrwihbjyQ+6IH351foTcXk5f0/3urY3+zEnqztdPi9UhLdOQTykM9RAoZ4ZV3Dnwq3xW8w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuKyhDwhMQUaiqe3O9n9vreT5gedcMOpx+UOqdqmgOdWiUB17q
	P3DVh/vzxzylXrvp8F1nwa8/hlyzM009PkOSGqKCjwYbyQBcSV8umzEZIg21w28elOUOqyuqFAs
	PfiZYbcW2B1ZGKZE/3fBEzz8Pb7OVmT/Sj1KFy9U8aA==
X-Gm-Gg: AR+sD1275zFIA0zr1ApK288/SoaFw4asT2XLPi9p02kisnayx8C1VAJu1OAL/ZakIaV
	iDPvawrspmPXWg+a2hb9YYbWV0I5bZzQIkhc9dsHMfMJ+YpWcOgP1VbBjZEuevmFaClsBI0TsQQ
	nB/aTSuCCgzovFkmwTfFgOiVc4WwuvummUXMHpdSfgfX/kKpHTWsiuCEVCvUTAAA1M9RkdvCuiJ
	5+Yeg+KuWo+fDfmVnpk0SFFMroR5YfDb5LKVc5aFpB5p15W3ZLPzSXu3D+zacLU9H3oBRIrGYvg
	HjRp9wOvmi4UWgY03eD0f3wILIGUmV5BS0c+/qM2HkwgQsjbvtoOOi71BKtK4RNtnsf9Z4sNUDr
	P6P6eYqySJLFlIRNxGpZRSvr7V2RoFw==
X-Received: by 2002:adf:e012:0:20b0:47f:959f:f69c with SMTP id
 ffacd0b85a97d-481455ce280mr1198921f8f.7.1786358211845; Mon, 10 Aug 2026
 03:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
 <178609182923.193353.7287772568467157519.b4-review@b4>
In-Reply-To: <178609182923.193353.7287772568467157519.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Mon, 10 Aug 2026 12:36:39 +0200
X-Gm-Features: AUfX_mzXwFrJ-NjND3MQzEP6QwRNrCstHPVctQ1cLuVCmYnxx742CiD2MW3y8Ss
Message-ID: <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device driver
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	=?UTF-8?Q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +
> > +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
> > +                                          struct aspeed_pci_bmc_dev *p=
ci_bmc_dev)
> > +{
> > +     resource_size_t bar =3D pci_resource_start(pdev, 1);
> > +     struct plat_serial8250_port *port;
> > +     u16 vuart_ioport;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ASPEED_BMC_VUART; i++) {
> > +             port =3D &pci_bmc_dev->uart[i];
> > +
> > +             /* ASPEED BMC device shift addresses by 2 to the left */
> > +             vuart_ioport =3D vuart_port_addr[i] << 2;
> > +
> > +             port->mapbase =3D bar + vuart_ioport;
> > +             port->uartclk =3D 115200 * 16;
> > +             port->irq =3D pci_irq_vector(pdev, vuart_msi_index[i]);
> > +             port->iotype =3D UPIO_MEM32;
> > +             port->type =3D PORT_16550A;
> > +             port->flags |=3D (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXE=
D_TYPE);
> > +             port->regshift =3D 2;
> > +     }
> > +
> > +     pci_bmc_dev->cell =3D (struct mfd_cell) {
> > +             .name           =3D "serial8250",
> > +             .platform_data  =3D pci_bmc_dev->uart,
> > +             .pdata_size     =3D sizeof(pci_bmc_dev->uart),
> > +     };
>
> In the commit message you're describing that the MFD driver will be used =
for
> setting up MSI interrupts:
> > It doesn't bind the whole PCIe resource to allow each sub-driver to bin=
d the
> > needed addresses.
>
> But you're adding the UART devices here which now means that the core dri=
ver is
> doing more than MSI interrupt init.

I might have misunderstood but this is creating the UART device by
using the 'serial8250' driver.

> the core driver is doing more than MSI interrupt init.

Yes, as the core driver should add the devices with the right drivers.
I will add this in the commit message.

> Suggestion from my side would be to have an array of `mfd_cell` where you=
 define
> which devices are part of the MFD,

There is already such an array, it is a one element array as only the
VUART is done.
'struct mfd_cell cell; ' will become an real array when KCS will be
added afterwards.

This is not an 2 cell array for the 2 VUART as the 'serial8250'
manages the two VUART on its own.
From what I have researched, this was the way to add UART devices from
an MFD driver.

> and your VUART lives in another driver.
> See `ls2k-bmc-core` for example.

The UART already lives in another driver: the 'serial8250' driver.

Regards,
Gr=C3=A9goire
