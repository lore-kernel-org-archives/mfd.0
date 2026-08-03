Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197DF431E74
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 20:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790005; cv=none; b=Gl49Q9tabLnSXq3NEZeYrim56CbzoElCnwQ7YSYYXMeCND+sGcfDxPu8ST26rz8RfCLUZE00WB+9HX43+Ef94c18MsCKQv5UwnriuE6rataaF426l6pMe5J16pCdbWVlIMmDzuHTk9tMSC+ER/5rzHKt26t+03+C2+ObiDXYAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790005; c=relaxed/simple;
	bh=wBX8BLZdTegOaun5exk4Y6K5BxBMg2rdL/rBxt1YWWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKdOd93Pfxh4X5ZNsgi6IoPFc73Dp7/4k04lEZ0ucWpZ794mRrDurk5lvM5hmKkCDDr0fSkwFMeeLjahPVDecj+WbYlwIjhR3/g+62Ig89clChb6pDMl0oja+5r9Sj4rv8dDs3bsu+tjaB/zwz4On5s8zbPQNoIZa1n8tqcdRCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=EsRdQp1e; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="EsRdQp1e"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-455ee8f529dso678430fac.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 13:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1785790003; x=1786394803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7CkkLegqd2C08aV3jq1XWB4t5IoMIYqhhbrvHHvW604=;
        b=EsRdQp1eZzYy7KvoV7NTJ6LpB4UoDEzXFuk88bzlfCM99+9BozykAZbe2JSbvucvam
         UZZ6uTYHdMHJSkS/lgSs+IwDrbAdB+UowLEZm7rj+3a9gfoHDwZgInMJW8hH1TTWvurQ
         piJSw12/wXm7YzhCfptaoTOZfctyr1GTwunpOwIFqHd07NXJvQtcmtuaYhTAS1vA1BQF
         zU1T7JCcL9jIPA6s5u57BWrXP1wVtKHRhAeskg8WfROqsYekQ5m1XB64GNIRWvZfYTbC
         PZ5ZCzUKGISuRbbePd1aYsrZwIhlmbXXEAV1E+JcjYqmvStJgSxONNWTIjW7TcW2IhaV
         B2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790003; x=1786394803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CkkLegqd2C08aV3jq1XWB4t5IoMIYqhhbrvHHvW604=;
        b=h8X92f+THyWbtZ8Ny35p6CjDIhBSf+MLVw5YzZaCMBlC0HwgNtPD3IvD90BnLZkVLX
         T8yQVZ6MoeEbfOuKmr9cw9B5QucBL9jECmbsXMEWWlmrDlDDYXu3c/+aybj0Wzm/ThBb
         CBzllZY+K0YQMItfOkDoiBOn1eNcQN+472Xs2vBU3BeHH2XmRJZj84oVLRpcr57fCxf8
         yEdMeGOZTuov+j0YlzSYKEZdAv5CE97YHUJnaqPXcxC/OE1XKpbUJnN5E1Eo7a1LTZin
         n9A0hnK1p145BaUY34tvTaoTMkyEJahCZfWdshQbrezLali+nTR1NhLcEaJCpH+nAHze
         9b+g==
X-Forwarded-Encrypted: i=1; AHgh+RpyKmDH3QxMyddvV5ioSasC+xmZniITmU2CD2VYLJ+Z5uTkrB7PitjIWS+i664Utar6Ebs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmK7Qu11odL3pi59bI0btnu1DWlaBatQqyNX1z/BBU150he4Pa
	yqB1bgAvNQ9kdSBtShTKnomQ7OksxzdXcFBrT++At/yHfAbd/jK905hzpqhjfEDwdoA=
X-Gm-Gg: AR+sD10mmzX6gwRWoYvhmuZpb2Q6dYeywq0Je5Yom/rdfer5aJNLTPklSXQAW7xBmW+
	l3eEfPazy07+H5sc2Vad+vKXDYNGeN/MHSHjQhgZ2FT3noEbG5/zk4yEdbJ9Qz+JZVSBzWAX4Ag
	7jiuooCiZ4No1hjQjO2DMRcMzg1rkQTo175rgzIBUwjGKEVofJ9HP89WrjSX09xFL7faPn7Z50K
	1I39bgk3H2xEur93YO5+JzlyyFKWel4S9nU7fB284oJLyFjDCHALbNecHr3cBLCCbFCeDdFD4Up
	5GMf82vwdvvWXT0Jq4qGcbUNIY0qjMYhqV9a1VtN2JaVoqdsG5niptQzl75HccDOBYCboZd+aVB
	YqvLDyyeSMNkuO7v1Sd8TmVBSkWRuEZIAHrrawR92SzQSvuGNuNbEHLbStNF7FpAeqdoj4Xx/ED
	uIT40ITc4Xp640n/+kbzKHM8sne23Ozt9vjd57P4/VXUDnQqBBYJA4LbqLjWxuYFex+aKmNWMyE
	YuwpZlOciNAiLd7PTmsL3xRtGML6O3msYyVwp/yaU0DHNEmF0+CGWPMqKRF5LxCwhOcbgHiQCGf
	o3AjTpWemokC6i57xhAQ
X-Received: by 2002:a05:6871:646:b0:43d:8b5:933c with SMTP id 586e51a60fabf-459057b3bd5mr18200643fac.8.1785790001800;
        Mon, 03 Aug 2026 13:46:41 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:398b:b195:5c26:85bd])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064843sm9889268fac.4.2026.08.03.13.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:46:41 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:46:36 -0500
From: Corey Minyard <corey@minyard.net>
To: shankerwangmiao@gmail.com
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
Message-ID: <anD-LJYB-afdVAXN@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>

On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay wrote:
> From: Miao Wang <shankerwangmiao@gmail.com>
> 
> There is no strong dependency between the IPMI driver and its mfd
> driver. Although the IPMI driver will not work without the mfd driver,
> it is not a hard dependency. The IPMI driver can actually be compiled
> without the mfd driver, and it will just fail to probe. When the mfd
> driver is loaded, the IPMI driver will probe successfully. Therefore,
> the dependency of the IPMI driver on its mfd driver should be relaxed
> to "imply" from "select". This will allow the mfd driver to be compiled
> as a module and the IPMI driver to be compiled as a part of the ipmi_si
> module. The adjustment to Kconfig for the mfd driver will be introduced
> in the later patch in this series.

I don't think that's what "imply" is for.  Imply seems to be for if
there is another subsystem that can use this subsystem, but doesn't
require it to exist.

For instance:

config SENSORS_NPCM7XX
        tristate "Nuvoton NPCM750 and compatible PWM and Fan controllers"
        imply THERMAL

The fan controller will work fine without the thermal subsystem; you
can control the fan speed without it.  But the thermal subsystem is the
logical user of this.  I looked at many of these things like this.

In the IPMI case, the IPMI driver is useless without the mfd part.  So
there's no point in compiling the IPMI part of this if the mfd part is
not there.

I could be wrong, but I can't see why you would want to do this.

-corey

> 
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/char/ipmi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 669f7600019747bcd2b37563477cf336f19a0407..f456e3e89416932f0d21bb742153a503aeb24267 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -87,7 +87,7 @@ config IPMI_IPMB
>  config IPMI_LS2K
>  	bool 'Loongson-2K IPMI interface'
>  	depends on LOONGARCH
> -	select MFD_LS2K_BMC_CORE
> +	imply MFD_LS2K_BMC_CORE
>  	help
>  	  Provides a driver for Loongson-2K IPMI interfaces.
>  
> 
> -- 
> 2.49.0
> 
> 
