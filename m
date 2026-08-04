Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6119367F5E
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843596; cv=none; b=WvobISWyf23jf05cDnsjHy4PhtDAbsA92jFnlOcajZGkea2DQWCY37WbgFKHoZbl1FOSrcbXuEkFMrgT2K0CvKUpfaELLgaTqVyGEYl0l4V2e5FxRGzpsrBSWVZ/2eGeZQHrK0Z0EExUzfhHuqkfOJyskseMH5FgyEQiRvFAA7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843596; c=relaxed/simple;
	bh=BQ7WHkmsN7sjhWQsoh8A1q3yCI/nauUkLzfd6bIzFqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7rv8RrqLqBAlsPGcHQuwfTh+jCjXKNbD/63ewvSy4m0uZzCkj0lHx8BOqd29eowfCjs/6oule7/hfTzkhYhZKX2JBDgoISju5ILV09R3C16CsznALq24sZ2ZKV0ZsAh0cjWhYDjLJY1oDvf0drNQ7xe4s37Ief6rri3yoM2cYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=D8B9uxZc; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="D8B9uxZc"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-49c38a4f110so2737638b6e.1
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1785843592; x=1786448392; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uh88uVU2Clp3KX7S7raepUOo/ZiMhFmmzr28cgkt3o=;
        b=D8B9uxZcMaCZaXzi+Np1bxUwNhu6Kd00CF/MO3dmvz3/JLYaGVrvfPG5CEQ32Lnqkh
         LScMQR5Vzh9GgKol5hDIaFn4nUbQpXoQt3+LApZ/bNFcJ320HaxMPfpGYQ1iYJlOFmWo
         HGs1YkXgqLudiTnVbUq8IKyN4u/TzAn9G/uV4BBjxdrqflh+apqpjYehOgNTFSeiFHxg
         +TeDrjZKCxZPc8qptiSzTLMh1hR2ui57z4mRcBOXNCX8jvm0MTug0byam+NzhaVii03z
         jONAckKigOmPpk5AtkorNwAhTkHrSbgZ7bhi/YxSti6vqdbeK5is+nQDDxyAQGE+dZU2
         JqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785843592; x=1786448392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uh88uVU2Clp3KX7S7raepUOo/ZiMhFmmzr28cgkt3o=;
        b=JK5kdWRlIeV5qSuALspykcm0I2DX8ftdOlAaAbEangLxjHdhxyx3XHrMW+dpp6GDwI
         T0ayBtQ5CFQOpYJnorIybgdbwdxnb7jNCmJ+w3OJJx0WLmVXNAqK4qNAuuCLSLIRjZ9z
         rv7BNi7nOVotg1zhwASPnxVRkOqXOiLDw5qtBcQ6QrP9+oOj9DlqBCTOj6PaWWxLOhTg
         nkqw1O+YyIlH4GaNGQT5gJNhwTackYbDa9IDljNgyOXvWSwxQ6d6r++IVCD5s5jH+tWv
         EiFtxd2fn/f7T+wkSITcY0e8sxvSVN6xNoSl/qJ1yhvIQ5tUM4QjVoXZIPkhjcAIQ/jC
         rBRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMhj1eCFufP4IA5ldipUErRgJJrLEfaXaIIxH0m2ECPmUDVJccsDphNqYL7hqI7WJwzlw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOyuTu8KowVVpxWuyhXRNVGtnLyox+S4zm6zumJUB31A2kQJUq
	6RlPsUwc4VcMnSCbkPQHJT7AjWjyzfu+JywxNLMU0/qt07r8pYPRK4mv49I2b3rCkC4=
X-Gm-Gg: AR+sD12S0nC3E2IELMj4o8MfwpLvwK+sRc+1wqzNsNdXUpOLWpjiApbfhg4JaLqW5zn
	eTon+GyNyn/ZolRDgCqovLvy2/XEwbRqY+G7Dn+9MtCaLPnPEz/mXiBO5dgionKdUlUlPNq/a+m
	VZh1seUQSuUbd7SwtNF0G61a9VytP44xip684P4zEKQV0psOww4LkyVc7KkDbFbU4M+W2zw3GSf
	tkNeRwBll5rAnDPOwByvOf426d8P51FGdt+SF780lukbOKLLge1WqL32YOpDVjoXTM2ERE5/B03
	M+KrnEq10WXc1XJTDpPZZteKG+DdqXXbgmP29vLD+wBMBFj035HxYXMvSwiTZM+CAlJTLMiZmDJ
	1OJo0hf2LtIagYKq1H1MFXdHyejhSwnpioWTYgHRbRAJMPI5JRq9mOzVjKWaxDslUaev+mt321b
	mz810ayZ0W2AdecBtU7g1OWaMpyVYgdsdeYuhKQJqaYH+2Y/eEllhzQh4+JNgBGTghiIxZL3uNI
	z/T5QlAeHZxKf2YgirR6GLllRJevngjKVQIX2J+GlXzinP2MllIpXxd/RgqqpOK48z/sT8unvcQ
	lf9tB3K5eQ==
X-Received: by 2002:a05:6808:2225:b0:4ab:230c:5faa with SMTP id 5614622812f47-4af5e3e5522mr19132771b6e.18.1785843592209;
        Tue, 04 Aug 2026 04:39:52 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:398b:b195:5c26:85bd])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9568asm8386849b6e.9.2026.08.04.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:39:50 -0700 (PDT)
Date: Tue, 4 Aug 2026 06:39:46 -0500
From: Corey Minyard <corey@minyard.net>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Message-ID: <anHPgqIj907WFEGT@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
 <anD-LJYB-afdVAXN@mail.minyard.net>
 <2E268CDE-1D85-4611-BFF7-F74DD36132AB@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2E268CDE-1D85-4611-BFF7-F74DD36132AB@gmail.com>

On Tue, Aug 04, 2026 at 05:40:14PM +0800, Miao Wang wrote:
> Hi,
> 
> > 2026年8月4日 04:46，Corey Minyard <corey@minyard.net> 写道：
> > 
> > On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay wrote:
> >> From: Miao Wang <shankerwangmiao@gmail.com>
> >> 
> >> There is no strong dependency between the IPMI driver and its mfd
> >> driver. Although the IPMI driver will not work without the mfd driver,
> >> it is not a hard dependency. The IPMI driver can actually be compiled
> >> without the mfd driver, and it will just fail to probe. When the mfd
> >> driver is loaded, the IPMI driver will probe successfully. Therefore,
> >> the dependency of the IPMI driver on its mfd driver should be relaxed
> >> to "imply" from "select". This will allow the mfd driver to be compiled
> >> as a module and the IPMI driver to be compiled as a part of the ipmi_si
> >> module. The adjustment to Kconfig for the mfd driver will be introduced
> >> in the later patch in this series.
> > 
> > I don't think that's what "imply" is for.  Imply seems to be for if
> > there is another subsystem that can use this subsystem, but doesn't
> > require it to exist.
> > 
> > For instance:
> > 
> > config SENSORS_NPCM7XX
> >        tristate "Nuvoton NPCM750 and compatible PWM and Fan controllers"
> >        imply THERMAL
> > 
> > The fan controller will work fine without the thermal subsystem; you
> > can control the fan speed without it.  But the thermal subsystem is the
> > logical user of this.  I looked at many of these things like this.
> > 
> > In the IPMI case, the IPMI driver is useless without the mfd part.  So
> > there's no point in compiling the IPMI part of this if the mfd part is
> > not there.
> > 
> > I could be wrong, but I can't see why you would want to do this.
> 
> The mfd part and the IPMI part loosely depend on each other. Without the
> IPMI part, the mfd part can still work to handle the display part.
> Without the mfd part, the IPMI part is indeed useless, but it will not
> generate compiling errors or other runtime errors. In the runtime,
> the IPMI part can be actually loaded earlier than the mfd part. As a
> result, their dependency is not that strong.

The operational dependency is strong, which is what I think you want to
convey here.

> 
> The reason why I want to change this is that "select" here requires the
> mfd part should also be compiled as built-in (i.e. = y), since the
> type of the configure entry IPMI_LS2K is bool. However, I cannot see
> there is no other reason preventing the mfd driver from compiling as
> a module. This patch series will introduce a minor fix, after which
> the mfd driver will be capable to be compiled as a module.
> 
> When the type of MFD_LS2K_BMC_CORE is changed to tristate, the "select"
> here will prevent selecting =m for MFD_LS2K_BMC_CORE. I thus believe
> that "select" here should be also changed.
> 
> Any suggestions on declaring the dependency of the both parts?

Ok, I understand now.

Why can't the IPMI part be compiled as a module?  Making that
module-capable would be the right fix, I think.  I can't see
why that wouldn't work.  IIRC, it was bool because the mfd part
was bool.

If you changed to imply, you would need a depends on the mfd core, BTW.

Also, IPMI_LS2K needs a "depends on IPMI_SI" either way.  I missed that
earlier.  Could you add that?

Thanks,

-corey

> 
> Cheers,
> 
> Miao Wang
