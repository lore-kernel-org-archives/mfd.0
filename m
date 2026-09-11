Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1073EA962
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100857; cv=none; b=tmTQcXsLT+GXTJBzubrzTo+H725lJDGVQLr42mkJeTmRcPg79CtTBCMA992g3kKEK1WY5Il2TE91TgBV8NsxLYWvuv33P/Xvm1nWgxllvLuAFGdoeEU+QDd3GObl8OZunpSJOBTqBoVdnSMomWvEHKCJKsu7wPLPpQsetpAmrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100857; c=relaxed/simple;
	bh=KjXa5CpY0t7/Sea2aeIy9K61ObkwGdgMdzuD+QojuEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bl5IItgzP3MqPZyFZCaE9J65cMamvv/TMZbP23tkD4m1ih4HLd8p+GwWKvUn2PWbIGl0p3npKwSiiTKaG01kQ47BcoTGtYtIbwWO3cx5wKpSyHmPH41zm6+rO3yjVAnH1V5vdPyWSvvcRrwWt5eDJrABVRO7ps+3yysJo7kQ44c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY7pB0yd; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY7pB0yd"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so579721e87.3
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789100854; x=1789705654; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeQKP5JwuVTGflKEgsNGx/HQonSB5aJLQdw22Qx3ZnY=;
        b=OY7pB0yddmw+lGDPTOxC/let+a66klbXmWkAdgfteLAdbtzCjYDb5Hd4c5vtVRV9kx
         MMmlsXSJvkMQQNfhC+T9rZhKuNKf+J4sPDz1XwKFzAdYQrGG2UQNKrDIZ+qEBUqST6dN
         f6nmR30a6sWjgD1feaVMLaKVXeWn9zTccgaaUHG2vsEy7vrV7vpetJHGJtj7pVYURj7l
         66epEd3xOCAMZt3s4++UoArK9cOWMkf9a6y7LgRUONirDWMZfsKfQxtzKTV1tc0pKE0H
         DxLnCnKkveam4kcu40R8/EA2bHkphlCi0RyGJUk0vlxr7WXQwUOpVKb8zinxnJ1723ia
         DLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100854; x=1789705654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeQKP5JwuVTGflKEgsNGx/HQonSB5aJLQdw22Qx3ZnY=;
        b=L/AA+Hkeup4vovsuHJb7k9qwj1eCAQzqLq6zKVmR3u1xK4kuv6zhr+G/AnI8chbrYq
         n/x3BcoBYUQm5DjPt7eTvycVSZKXtqLSnY8SsoPbSr+eOBMYAw/2FaEVdBvyLG/e1Pay
         czDJghkH2NlBAidy1pVGbfOQCJRq8aHPdsxAChhjWvu7jrjZ+TbPW9AIqyaznOT0HmiB
         tDCKbhMkD9QDZGZikJAINJyuemYW2kLm7XXhO2krOoncjQqD9N8zYvW+iq907HTo66FA
         H7cW0nIXts36sqNS86A90Oyf3q7tTWymN4Rg8BAQTf1IRzs07RiFLk4AM1AlT4kiRSzv
         KZ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwby+84h0cZInIUOG8rhXQTqdiGY0j3PwS1jlDW9ynfD+xPrmkKtUfAMeypmhQmgbHDUAY=@lists.linux.dev
X-Gm-Message-State: AFuF++kE0jjqjlc9uSuKWL6Om9J03xFkYd+Jo7KiWe9V3vbkzzSU7nQz
	xHHmNXpCO+ozkII/SOaFwRLas3njhGYBiu+ceoAfb7fkWs4q6oNlSgbF
X-Gm-Gg: AYBFou0dvTTmZzOYJvgcCr6aROiENXLauUKiHsIDbvu7048Z2m0Lt8Kbgj767Q2IZvn
	SUQ02oijUZT6jhfeUcZWpCLgPvja43fjJREG8xxXQzAXjZgxS+hXREz8m2SPQ78NdwgYZmvJArz
	6JuHgSovds9OFjMq/WeTTlggAPaWzAaqWfaj2OXSHu3QDdbYtJlNGqQ6cUymjyuhz712rq0DuED
	JYDRK5rGTstgIfb2YpOrmTz/hewZDU6fMTiiEoNyRFLPlT/NR5AiPx9OjTTnoHfQY7LezDOX0Qt
	6gp30n5Y/VvQ5z5A+2UdhJCs1P5FydSLn3UNFoZ4DFdpJbI/thlSpMH4XLUhR/Wj3Npt2sNQClD
	xYiNUfT5rLzaJi/Tl+r5WCnjoaI53dnFkGpkhjRzN1Meqq3Gcp/n7asQbB5NpNOM9HYrgd5ZnTM
	1HlVL0Xu+AprjGUUCBRIjyhB2v36A+MAqQGCS8MVStGVar1vaOi2GL88CXVx0DqkKgZCQ2/ujaQ
	1IeIV9eiE5lL3S+yydhzy+0o3nKqPt/IctaBIXIjsnvvfGrU3HQLsU=
X-Received: by 2002:a05:6512:3f23:b0:5b6:6af:4e0e with SMTP id 2adb3069b0e04-5b8a02dccabmr896014e87.3.1789100853635;
        Thu, 10 Sep 2026 21:27:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0466a5csm291547e87.46.2026.09.10.21.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:31 -0700 (PDT)
Message-ID: <eb18485c-50db-4823-9e06-362b968699cc@gmail.com>
Date: Fri, 11 Sep 2026 07:27:30 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Support ROHM BD73800
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <20260910160321.GJ1051768@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260910160321.GJ1051768@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2026 19:03, Lee Jones wrote:
> On Wed, 02 Sep 2026, Matti Vaittinen wrote:
> 
>> Add support for the ROHM BD73800 PMIC and compatibles.
>>
>> The ROHM BD73800 is a power management IC which integrates 8 BUCKs and 4
>> LDOs. There is also an ADC and operation amplifier intended for current
>> / temperature measurement and accumulation. RTC and 32.768 kHz clock
>> gate are also included. The PMIC can be customized via OTP and it has
>> options for operating as a main PMIC in multi-PMIC installation. Some
>> of the pins can also be used for GPO or GPI (including interrupt support).
>>
>> There are also ROHM BD71851 and BD71885 PMICs out there. These are, from
>> the SW-perspective, similar to the BD73800. There is only some different
>> default values and OTP settings. The driver should be able to handle them
>> just fine.
>>
>> Revision history:
>>
>> v2 => v3:
>>   - Rebased on v7.3-rc1.
>>   - gpio: Use gpio-regmap as was suggested by Linus W.
>>   More accurate change-log in individual patches.
>>
>> v1 => v2:
>>   - Rebased on regulator/for-7.3 as it carries dependency:
>>     f29a8bf6fde1 ("regulator: dt-bindings: ROHM PMIC state-machine voltages")
>>   - dt-bindings: Various fixes, split generic stuff to own files.
>>   - gpio: Styling, return -ENODEV if no GPIOs found
>>   - MFD: Styling
>>   - regulator: Simplify dt-reading
>>   More accurate change-log in individual patches.
> 
> I assume there will be one more revision?
> 

Hi Lee,

I thought everything was acked and good to go?

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
