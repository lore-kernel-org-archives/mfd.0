Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CB3AD530
	for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149193; cv=pass; b=SLMyppyCVZ9T9lJ5fDkFt2HNpQe3TyxaId7PqeXnxnrJ9Ir+aUtBKc1Q2lnEjemYqhV8oxyroQj0XYLHnVRUq1TmoE+NYEmAx1S6FTAJnPJdQVtxQXU4aFoTsY+VRSXcoi9l0ZyrAIOpgnE1rRWYT1olk1MgllY4nMsyK5CrlDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149193; c=relaxed/simple;
	bh=flgCWjJ0Vcdob2VFEhwHid/TpVFCevn8cCNPvWAm4QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/6pfHeH4dMtkrbJ4o0p8R3su6klCyJQEU4c1gbyD+ZZZYpD8WORcwhYv8n9Nty9/UmY7YiDvroCKwphNKx85NxITTXqnOLzZj+iJTib3OhRn9WKKbX6Gumbxlqedr03Px4vjxJzQeuBg9JKCfBzAxPLSWRVlfBrdS21J6jn+yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ezhjKoJv; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ezhjKoJv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49557167508so11427075e9.1
        for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 07:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787149190; cv=none;
        d=google.com; s=arc-20260327;
        b=PkRTx6PuA8NMymcQMpmUFCcceXb5+XZOkuHS0TfMRoPzk5C45PyfdXncGxWGuEk+W7
         QbZWrqCeQYQnLoIpEqQmQ7+Rn+jp2n0bc/HrK1N0Nd22uqNGIHRAUPFahfCcLnL/XZ1g
         L7Z75nBgDvYS5xKyT7DN4IHgW87zLFKKNECqbdNbUgd9ZfSznKBblfk6K8MKL471kets
         Hxs1BK9dWlI7rtWUz6bgRbzjMyI7ZKJVX1NZmOpmQblkoiBMAIxYy7zC3lHtVe958ktJ
         kR+cYZ1lNg8/BIlCnIz9PA7Y2Fh1BPGqaVA8cv0m2KJ4xlvrS4XtK/uNQhT1q4v/fBIY
         pi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        fh=engy8eEWZ1ZE9fYRMfMTHqZ4duDUhopaS+BbJxQ0N58=;
        b=hjLCbw+Z8w5FuwRzs2JPfYzU/gDQUYjHhpmg5h/YNuoEMspYoqsj1VUwtXizf9Yn9b
         Je8BouSDLhxoM5k3/29YQ4kUjQ9bV3jzKeMohLUPnBun8Xrt0/1AY9tS3QSRyt4X92M/
         zv/Y1GjPW6wWxAShKyGUzsnSRcWdKVp4Cb+GZwc612l2Caiix8XyJiPrHqJafd08byNd
         cZxsH39ndJ8q4iKlJLainz2T9xu7Ug+qQaZR+sXi3wUYZqnpnr/2IJiZrFbVDW47pcTi
         Xpt+WL3UZJABb5VWJg2cSQlnmg60AWbXKUxReXZjilvwtzNbR54PptTX3b4wc8w0Evk0
         h4kQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787149190; x=1787753990; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        b=ezhjKoJvLMf5W+ZytgJop0nRSfXEMv6NSJnSXJqESmKoeKloE5cynaC/qnMo9lBP8o
         XDJuuVAtFAH9pEW8u2BZAxoUq2BDFlgkEZJpoNWpgj02qrUJOjZ9uAhgNJKhzFTmOClo
         Xrzha5EZtoerAfatquZPe+S31o+DXoTfuMMzu0HjCrSTEQLrODNubmLpoavlqj0p8rXU
         puqmPiXVPiPFhfU4hD9CCJ1fb3QYOChCOxAxWdw07IKSiRfvDB+bp+jp1iWpzp8nasyY
         //CLypCNDaIM/t52HcqLlaR3X09KwOQcT/nhj5iohCPH1el4uodp4VkePsDkcvRaWQjV
         KuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149190; x=1787753990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        b=GtotJfJO1THfBlmoahGMBjCJO8BVWOsJhl55/jU+XJOTzyYzg4s73b4xWZtMbhezfC
         NeZi9lrK1BU91R6bSKumwTkhJCP1UvJQ1iTAza12Mq22VTFer7QRJ7iIFIkKgxvzQk+d
         kpZbA85jIaUo9PN9QIGjh13+UlkfLcItBwUF7ZzLdRx3blKVyPXa71taepZ0cnq7ngmZ
         U7oHhak2daHKD5a3yroGYwDj+0r2AhbTHuE/Z08vpnkL9rihG6c60p49RfUvzDA9smDC
         qlWIH/uhpr9U+C2bpnUy9m4xdEI56Ufs6v5cyn9efy+gTBDWDDDMHpPWOdcuH+08ov9i
         d+ng==
X-Forwarded-Encrypted: i=1; AHgh+Rrrpom/h3UyCOxd2sA9mvBp13yvtQkQWO9N4cyCuMxm26RQTjUQLE+sWS120wAOhWOdjbE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ1PrzORXgTs2k+n7ZTxuwwR4WmT6q+Q9tNz/6nOVB1K/Gns76
	MngBg4PHcFziP8njp0ED3qG5adjEwEkmkA2r5jjotUvjGB1smvXoeIGYj/i0yG36jvX+X/Esw2Z
	vbWtL4D85qfO/J5vzLzI7nUs1Gw6UyWub5ajtG6X0ew==
X-Gm-Gg: AR+sD13vtExgfM/X5ElncPZkQxgBG9X5JOY7UI2pRJJ/UO65kxZYcfBlfo5l/+7i8/v
	2MvSJUS2wdvO79IIVDf3WG3+WIztdLZF0SCkagv8fRgvzR8Vf64OXUU3+jRl3DTR/vHOeuBNwLU
	d0XQDUfJ0W96gkvqIx+cfJcd7fUMItSH25H0PP2mhC2EZCT448WOQh8GOWHoRzex9R1a70waruU
	pgDxX00gks4O2FRtav1Dflyt+pC9GHPUuziJSXhNxt0J9D2tjtRdXJ3rXmq2r8grhNpQgWEIL7s
	hVX9YD3EivWVEwwjEWgjiU4TOhcgbAqtJUeSZvarTlQ5sJZrYMXr38Hws7312GJ1n2PmDD5IsFn
	84xIN2N3nbcRqLdP9eANQAWDFLHMlk8nIPvU=
X-Received: by 2002:a05:600c:3485:b0:499:a685:c10 with SMTP id
 5b1f17b1804b1-499aa19a3b8mr105118355e9.4.1787149189928; Wed, 19 Aug 2026
 07:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com> <178714815308.32179.15619694497271022262.b4-review@b4>
In-Reply-To: <178714815308.32179.15619694497271022262.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 19 Aug 2026 16:19:37 +0200
X-Gm-Features: AcwNN1WSp5z3ykm5DhYgUXUEaifqr2FKPqOZiTmJSVGHJcNVXhm6Z3n9CL5gr0M
Message-ID: <CAFi2wKbvOX+E=nsWuVJj=_xQZQm=vCA=qPWwzgJF2oio2ov_UQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver
To: Tan Siewert <tan.siewert@9elements.com>
Cc: yh_chung@aspeedtech.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
	=?UTF-8?Q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

> > +ASPEED PCI BMC DEVICE DRIVER
> > +M:   Gr=C3=A9goire Layet <git@gregoirelayet.com>
> > +M:   Tan Siewert <tan.siewert@9elements.com>
> > +S:   Maintained
> > +F:   drivers/mfd/aspeed-pci-core.c
>
> I think it'd make sense to add the linux-aspeed list as `L` here.

This is already the case.
The following maintainers and lists are set for all paths containing
the word 'aspeed'.

From the MAINTAINERS file:
```
ARM/ASPEED MACHINE SUPPORT
M: Joel Stanley <joel@jms.id.au>
M: Andrew Jeffery <andrew@codeconstruct.com.au>
L: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
L: linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
S: Supported
Q: https://patchwork.ozlabs.org/project/linux-aspeed/list/
T: git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
F: Documentation/devicetree/bindings/arm/aspeed/
F: arch/arm/boot/dts/aspeed/
F: arch/arm/mach-aspeed/
F: arch/arm64/boot/dts/aspeed/
N: aspeed
```

From the linux kernel doc [1] :
> N: Files and directories Regex patterns.

[1] https://www.kernel.org/doc/html/latest/process/maintainers.html

Regards,
Gr=C3=A9goire
