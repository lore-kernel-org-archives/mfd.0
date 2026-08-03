Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1505371049
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775016; cv=pass; b=nQAgBEc1vxRk7EYVjkjDC/XlCElY1cf8n66k6OAbuZzSM9ALlqFZmZOc2oWqEHbbeYLRWmAfmJjGT/FnPV8j0DVOhtwHaJ0ADolakNgswKq9wIvJXDZgbWEcu5v85igE9hXKZsZFeQ5k5o90yhujP3AC4WgSh8/QJiLfmSmIvfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775016; c=relaxed/simple;
	bh=K7WSdWoRnNatXjyT6a0V545KuC7+pJeUxQF1yR9byhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3/Sy785jTV+V5JHN5vbtindkc5YE4QQXxNdKGGY8OFix4n1+mWL98Udff/HVBlBhQCbj3EZb028lm6Bw6bO5VXOjhLD/wtZ0f/6p8aOzmPAaZ6tETq6DBxnJIClmkEQq25EprusyBLjLiC2XXbb5fzdpypb1aF9SY6l4s8FzPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haDJU66C; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haDJU66C"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso2172186241.2
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775014; cv=none;
        d=google.com; s=arc-20260327;
        b=GB3+2VF7XHHht0YUFlgqusX8T5vifTHL5TS5eTNDAawTEoHVmNtzWN7MVXbpCz7J02
         YKkG1ZPj8b8LD5QLUD4kNa4dyfQwLdZj59oyyT33m+4Ap0SAbz2F1Ck76AxxH+vfr6Ic
         X8csZa2FNftIg8fz8bfu7VYSI1achNE5k0Y5sDLp/gPFs7hjTPCVYVx2ldeIym22KnPr
         xGxQuUKOKfTnGIFECC2QR/HdogV9N646yxfnDHPtZ7gd/VOXNX+TJ5fmg7zg5mGI8ydX
         2Og2wkJgsfggV1DLaX/Cp34n4apXgdbHOQHL4sBLFxM7CPI52i5hx3TphL2xTb/ZY2MK
         BMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        fh=1CMXBL9aPqwII5bE1TdnGO5KVPKOzhiuXdm2CRaf2Kk=;
        b=qPAfN0QNU98yAHAcI77o0sceNc+VzqdBNDA58GA8IdmdIJHMtgKMlvQGNLiduF2jFZ
         m1TIT5nSm4rIQeEHUS0OFEhRxLPNbwawwg+5STBRmECs7XWKfQLo2CXaplDfpKyC/Md+
         ZIn1/jer36iOjVX6xrZ3Gnd5ztCh6VC2Y69PYhIpekDlr6sMCiGc9tm0JgRt4iIZGDfT
         PY9BZtYCZzYIedJZQtkc03LJg4EfYQPzCqx38GEEk5zUdC/h+ytTzqQA57hkCin67Y14
         YNANQpSQATGGZO0q0O+3IF5XFY/WQ0Hf7PdRkvAe7LYybRysDKL8oA/Bg7tpEQ+a0Moy
         sxFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775014; x=1786379814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=haDJU66CT5tfqbYkvyIWJ9jmGA7MeUsLOCB6nDSRPSLFEg+CCzTXvbjnpeGCUZvaQg
         jz0SbBHbQu8y7MFSVdnLGyJPvKcYxRX6RwORy5TVf1G1/+u+5hGP5N4xlUvDD/u2Phfz
         lrqjLivI8/pv1XMzXR/M/d61sZvQalPRk4s8VlcWOZ4HmRTdtmnRBuZFlxKvuqSYNTA1
         QMxG/GRlRcsQnBwArduagDP+3T46Xv6LVg2RC4tnm6oUVIU4j72V/9RzzZCtNpmYK1SI
         wMJoFJZGoTN0Ds9SZVxaeIzA/KFXnfIH16xTA3gwQiqijviKcf9juCJgXAMsJ3fiNVgr
         5qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775014; x=1786379814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=LRbWW0jRnYR7VkK6iv4QIng+uX1QJYnY/UpttlVPZQ027zufFEJiWydPzk+yVZLwwU
         nUsqYAZZWxHraVsVWOkIJPejKv5M8O4Uh8D0cxjD4V4JRE87gG3PayG/XRDY727Ex9tR
         xvzc7yFamcecTnfLbac7a6WmWtxmOJn0Wh7cin5J+TR0YHnjYywP+EqUuSMa3KhFSIwv
         jxH/KRCV0O15QiwdjybE03MrV/OhcozC+QX2fhnnEh2gpfK8C8gVYuPMwFQgQxFQhwtH
         yantIIeND92yyqP2sSeomCn69MeyVRNmbyjO23o1BgKrtiik6kVhrBRdpRxrJ6Kp8+c+
         6Vew==
X-Forwarded-Encrypted: i=1; AHgh+RqobxEHQnrWZ4sOh6icPWf4jpnLt7ZPT71frNsvUevSc7LlTTjQ53oKoQj6mvtwPj2CNcg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh3HZGCXZte5rTDAo6G3fyUDJwQ23Oae/mT9QnRdkUTEFfjkED
	2w1Smd4U0OBpwpKQHdLW0TY8PiXbG+gqTtE3cJdAVtjE9LEuR7bYu5zZeTy0aoHWlEGHtDk3bc4
	H/0ns/BNifyuGHOhsrUUzWTpiAzmAPHjHmlcz
X-Gm-Gg: AR+sD10lJeadFm6nqgIr4GQJ645xvDNdWA0WbdBXSFN0oB6qoRy7yooHISlNcdEPohF
	qFI5Y/D5X4m5ntTkn63ALUQmNGjk0aJ8gj9HSwOb79Scc2sI5y6wKtDrX+R6X5rvXOfcN4NMVYj
	c6zxA1oMF1SqB5bN+kLi1OgCGe7xlaFhPQ2tbmvWfdo7/mVQnt/jr+XLJU9twBGp0wT+9vzRt6c
	rjE8aUfHHKln8tyQSCgXTabV5nNjk2y+jB0Yp1so3QaJ9pf+6+fM0hj5tNF66kSCbZEagcfVidM
	vr6lUlq0IxX4Yxvn795PTPLIx3PAN+VR6eWniLNaJkisKbHZTTWdISZ3X7NA3nV1LQY+p6RZpjI
	Aj7fh32ujn82Lr++aA8iksOPhJBk0jUnx+3S/lGmEbKYRG7tLd8lBNCK08DzEtVMN3nP4soYvgd
	RZ2JJzWOgHqI6wWTxygu63EkyEZ/l+1qKRWv17lfMCGwxsDEs=
X-Received: by 2002:a05:6102:41a9:b0:740:2bcd:24d2 with SMTP id
 ada2fe7eead31-75b2245a880mr8777953137.5.1785775013743; Mon, 03 Aug 2026
 09:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org> <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
In-Reply-To: <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:36:39 -0600
X-Gm-Features: AUfX_mxf143l7ltuwFHdM8jtybu0jFAqTogB47kH9lIVgz-FaKgqQGV-oPrZGYA
Message-ID: <CADvTj4qby5jow6BkvumZFK6cF8aLCTeQZz39VKEdm59jEtRp8w@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 2:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 10:20, Krzysztof Kozlowski wrote:
> >>>> --- /dev/null
> >>>> +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> >>>> @@ -0,0 +1,13 @@
> >>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>> +/*
> >>>> + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> >>>> + */
> >>>> +
> >>>> +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +
> >>>> +#define AC200_IRQ_TVE                        0
> >>>> +#define AC200_IRQ_EPHY                       1
> >>>> +#define AC200_IRQ_RTC                        2
> >>>
> >>> Hardware constants are not really bindings, even though you use them =
in
> >>> the driver.
> >>
> >> Should I do something different for this?
> >
> > I would just drop the defines and the header, because these are fixed
> > hardware numbers.
> >
>
> Hm, unless they are not and you added abstract ID numbers for both DTS
> and drivers? Then this would be fine.

Yeah, these are more abstract ID numbers, they aren't really hardware
constants as the driver translates them.

>
> Best regards,
> Krzysztof
