Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBDD41A778
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201772; cv=none; b=WPEJ9RbSWlGpD7dIFLREfTTqXcxuMRPUhW+aWcN3F9SswrVpghAvWfdc3iOjAbj+aD8wRFcmupVYZTCQiWtKWA62qOwAZq+rmoO2BQMuVNuH03PPboYZM8gjk29fCsFof3jZZ+kxuHkYl7Ifyp+hP5FgJbZWXcJkHp9vysd4n6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201772; c=relaxed/simple;
	bh=zetSJ0c59ByWOy2eXS5poYreELcox54ZDL3f0xEL8w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODg2G7l/bNYLu28loUswDTPHv1fxkDAY7gBqv8GTVZdZ5Praj64SL1S6N1ZJtcvdtJc/LfleVYPnRyMswcpx+C/AkSc7q1JsJyz0Dq9p1DMGqYzR+xaHfSYs6YTjqR6y+WWHzVD+yhRffLkKLDeZGWJyHX+W1TfBhOsp0sw2iCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+wf3FZD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+wf3FZD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38deea72eebso4374144a91.1
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201769; x=1784806569; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS5iPB2mRTWBqt3tZiXGx3hLWOV6ZMr66GfCmNpO9k8=;
        b=b+wf3FZDtLlw1Pg7r658U0cEcR/O7f21TZlyFTve6OdMbxJapeWJscjEYE8BKXD/JW
         UYtQvLt/fSjeXe4E9z6k3R1Q0TahurAx3Q2mOBWopHrtWT9oyy7tbOv8e3iiFFUnVQjY
         2XsJZXrlmFK6GRB4y/pVtgz2mcj2zWsfoxarW1JXjsasR43tYfw9enIdnCTEaK3pN74H
         jgHyxMRAtlP+oUOI79GBq6FY/sxLWUzZJM5TcYWCaIXT4jMxLlYezybfls1YBFIwmWVV
         lUIPKh1mM6jjVvRxtbwVb27vxm5H/7zfQt496667kiCEY/JhuQKg4ExONikZP+T00inb
         QMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201769; x=1784806569;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NS5iPB2mRTWBqt3tZiXGx3hLWOV6ZMr66GfCmNpO9k8=;
        b=jysf+HOR+dZnM093IzCcqg5ZZ8Txb0wEp00RCNdqvKJfdh1zGsUCpjAAileWb24S4v
         tcFn1xhx1/hyCvEDq8/asQiytdigwywNUHAU+cyQclakHnA6zYqzBuVrSp8mYXDDTCAX
         wVg9ZCRdFQFT3wCOnXbEH7Gsl9BThYkIXTiG0ElyUETZOqx6oe3XZxSkKhRPHcJHmMWt
         jI6NIs6EDPYCqUw6/5yTVkvCeB9vIr1NXxTA3wRaBZddkw/tnX2ClbTC7yJ9Dx5y4QBZ
         Ei1TAiBc+nO9TFvD2oLh5IFy+txG64QTFJ1gFVnPzQQuIRQ7c3ObOUrkkTiMx+AYidNN
         +EmQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4m4GUv74ltTDmNiLI2I9FX4XAwgo1H7hk9dRzi/yB3P4rFvgOctu96FK2LSsDAA0+eCA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH3H3gINX63CBDz5iz0IK5ZGtjEl2mssmLY58bdTp6v0D3Uat9
	gCP5e7Cae3Yp9MVVV9igHYFrZ6Q9KrmpELhlqqJrMAbi533nh8jdXd0f
X-Gm-Gg: AfdE7cnsd2IhxIORyKIzwgdOHLu8esSmXqNkBmb0AV20VC9oCLRvTR9H3o758cxWxaA
	7XuGigL5AyzQay3dWowv+/DiuLB6N7eyTBYJUFnzarh1eteNz6gk5f5AocNcLIaxWCDOUfq37Xz
	mJLxFGwe1PxSTcgumoTGm45a7+hR1lb3OlRWW3oHkDXOpPMuqK+XCOpy23gCBpH1FZeuIPot1zx
	52Qrksfx6ZpCqkT623qT9wC2ldwy3aqkC8tE2aSfSFNwLnP37aWGddBxLSoUWG4DdAe1ApUncts
	AGNw44UdQ+sNwC/tZfekTrPHwF+rgTJqgoi4UAJSVNw6nCictp6m/jj+IKMye2AF25rECWqe5TR
	zA05HHjyt1B1RfeQQYfpTfGVuVKTxgSP0KGnkWH4VUcS92m+gOK0nHFi4CjlQxIVJi+c9yiQBUN
	0IKXGUVosxiSqcb/uUWrimFsGE5UF/s3wkeAK0HRT4uXzrXuhk994=
X-Received: by 2002:a05:6a20:158e:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c36c1f13cfmr6949530637.31.1784201769130;
        Thu, 16 Jul 2026 04:36:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd426b36asm9053465c88.2.2026.07.16.04.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:36:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <16f3837d-b416-4d5d-8876-4e08d5a9ef26@roeck-us.net>
Date: Thu, 16 Jul 2026 04:36:06 -0700
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] Add Advantech EIO Hardware Monitor driver
To: Ramiro Manuel Silva Oliveira <Ramiro.Oliveira@advantech.de>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Wenkai.Chung" <Wenkai.Chung@advantech.com.tw>,
 Francisco Aragon-Trivino <Francisco.Aragon@advantech.de>,
 Hongzhi Wang <hongzhi.wang@advantech.de>,
 Mikhail Tsukerman <Mikhail.Tsukerman@advantech.de>,
 "Thomas.Kastner" <Thomas.Kastner@advantech.eu>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
 <20260714-upstream-v2-v2-3-76e5e41026db@advantech.com>
 <b7171173-aa64-4393-b9cf-77d92f2ec932@roeck-us.net>
 <PSAPR02MB4502BBD659D7C4FCDDCABB6294C72@PSAPR02MB4502.apcprd02.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PSAPR02MB4502BBD659D7C4FCDDCABB6294C72@PSAPR02MB4502.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/26 01:10, Ramiro Manuel Silva Oliveira wrote:
>> On 7/14/26 08:54, Ramiro Oliveira wrote:
>>> This driver controls the Hardware Monitor block of the Advantech EIO chip.
>>>
>>> There is a separate driver for the thermal device driver since it's a
>>> use case we support currently, but if it's really necessary we can
>>> move it to the same driver.
>>>
>>> Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
>>
>> Normally there would be a hwmon driver instantiating the thermal zone(s)
>> using HWMON_C_REGISTER_TZ. If the driver actively controls thermal zones
>> since it also handles fans, that would be instantiated from the hwmon driver.
>>
>> Since you have both thermal temperature and thermal fan drivers, I am very
>> concerned that there is functionality overlap andor even conflicts. You should
>> drop this driver and configure the thermal temperature driver to instantiate a
>> hwmon device from it if so desired.
> 
> But this hwmon driver doesn't control any setting, it just displays values. Fan
> and Thermal Zone control is handled in the thermal fan and thermal
> temperature drivers.
> 
> Also this hwmon shows values not related to temperature, like voltage,
> current and intrusion.
> 
> Would it be ok if I kept the HW Monitor since it only displays values, and if
> not can I keep it to show the other non-temperature values?
> 

All other similar drivers implement a hwmon driver and instantiate the thermal
subsystem from it. You decided to implement thermal drivers. You should only
have thermal or hwmon drivers, not both.

Having both would essentially implement two drivers with overlapping functionality.
Since you decided that you want separate thermal drivers, and two of them, you
should drop the hwmon driver.

Guenter

