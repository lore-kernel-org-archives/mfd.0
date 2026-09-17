Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC40F44AB6E
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676653; cv=none; b=dU/FC/kBJPdjGW2jpuWq824IoL/x42+WP7RzVQA7ertC5T7Walu9x12nnprTvu3U/Z0bKgoU5iKk3CRucUuTecxyYnHmSLuCBTY912GuCDSGWBjYTZfLTeL7iWVuTvxNRttr/NGbdd+dmOBQL9GkzEJOu5ETZLzwvZ+KuuG1Ziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676653; c=relaxed/simple;
	bh=Yshl8u41lsc1ZIeHhJ2AbGKqFXfjn1ErfK+AnH2JZhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo+lGA24ZWhd23uVBNjMGcjBAu6HbNpEyByfuStxoOZLeGdWwkM5sV8XIioN/NNdYkfiNemNrQp3bBSVg7m68HImwIK1uMRqOyhelpqUzs6uLbqUfqNSB/6W55F1VlEgZA3rnTlpSfhs/Op9tspWQfBD6nZXD/oFUtHyWGRlLgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAK21OL0; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAK21OL0"
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f9cc0e524aso429422a34.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789676648; x=1790281448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=;
        b=NAK21OL0FeI6WuEhd42vpQYbkfci1tCdDJr9AshPmjre3yczqdHvWua3vrroOkwGxx
         d5WqvrucsevXmRx9fsqgr3/IOsGnknrM5rE525KcsCDVK2VE5SWCChgDrxEKle8F52rj
         RMHsYRnq2LEYkQkyydw9CxoZ7OSrvuMCRzdU8QsHQwNfCYB+1vBF8foMgqHIqxT8kNVB
         Y/BMdxXrvRlh/DJSajYYs/1MRMZKZ+ieu8jSVu4mtkIB5iNU0o7HuBwV+tL68LZZw6PR
         r6Vc5KRxTMYQUtzUvdT4r8IFsOXISXrGpzr3C14bCFGQg8EG0K+S1mnYynS6hYdIaPnz
         URow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789676648; x=1790281448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=;
        b=AYR6NFYEk+RIFaQA9hD1XqxzDeZBOTVQ9ViVSkh1g4SZYpfgwYFDT9Sx4B16Uz3LXA
         dQFfUWvafv3o5mWb9HLt00nH0wfEQc8/utmzWIjiYK9TIsSCmGTMDltYZ5bTr5b/M+5u
         NWgkXJxCSoFmtDPYMl06+aO2uuucTv9Alg54TORRP0E1i/SvvAePIVpF0eHyAUxvwwWh
         k05lfaVLSLbGmYlYKGCIoNx5jPfjQRpJVSSqHEmoECH8xPxenjY0tN0k54ZV+MswyZ6+
         p4BKKmFz/1jS6T3029opm5ztHVb5uPZhxCK1rmqahCnRrl7WO3uuW0R4hbksiYic/CgH
         8UcQ==
X-Forwarded-Encrypted: i=1; AKwUvByn5lHrWc0AXhf5nvetCaIckl6hrk6RK3TFF1rh7h+rhfW03KTSr+Re/QXHIlhefTkTGNI=@lists.linux.dev
X-Gm-Message-State: AFuF++mycNUIgEXRLGmdgR2Ru91qq5Hh+rbbQB4JhYeTjGExzfPZiwzS
	o3bTXI2MN+coEh82GPqI5IQRrIMuLAuGcdp16qhIQ2t+xARmDoWyqikI
X-Gm-Gg: AYBFou3Buz0N8T5B1d4RDBlUKVfep734JjMpMlC92U6XqzKzmf388kAXG7LWpAc2loM
	0CX5idnhS3/5W39BenTUyBjzDdW6VmsiAFa2B+azhQb3TkKwAFi1cAwM1TxFIm0CivwpU3hOaJZ
	FjJx3K70asuihDB8uUUgTMUvjsrifHe9kXMcoclE+JYZgEOlWWcJTS6aOK04oLyLzftEi0si7L3
	F1wNZDaH1HMnv9uxaxJjLM/xopX4zViPx8tdcoQRmXi1c5a62O5bY4cPn9QIpVF1bDzZ4T49N5+
	ag/88JyTC1nhC76S27I+QS8OHnGh1w77mJ7dzX2NL2jPSwAufBhvfbHvsRwIxb6lsaP9cY2qp9W
	i48sse0wsNRHmC5StCAujgGHGxxYft08k4SATQQ77PJE4v3OVwwtF87fJEY93E70pthZbgtOBm3
	sY1VXx64Jyfd5QifWX00NpByYwh9w5shLtuGNJOoa6/11pH0cEkikKLTtrjKwc3dldNLwpjSQgs
	WWZQz1l9IZX1xg=
X-Received: by 2002:a05:6820:2219:b0:6b3:5475:4861 with SMTP id 006d021491bc7-6ca9aa3fb5dmr186014eaf.18.1789676648385;
        Thu, 17 Sep 2026 13:24:08 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f5cf48besm3802412eaf.4.2026.09.17.13.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:24:07 -0700 (PDT)
Message-ID: <2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com>
Date: Thu, 17 Sep 2026 15:24:05 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <aqpmgliQW7FW53o5@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqpmgliQW7FW53o5@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 4:50 AM, Andy Shevchenko wrote:
> On Tue, Sep 15, 2026 at 11:15:25PM -0500, Ryan Brue wrote:
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> This doesn't explain why a brand new driver? Perhaps we have existing code that
> may be updated to support this device?
I considered adding mt6397 support to either mt6323-auxadc or 
mt6359-auxadc, and both had problems.

Both mt6323-auxadc and mt6359-auxadc select channels through a request 
register (1 bit per channel), while mt6397 uses a 4-bit numeric field 
CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0). That was 
the biggest reason I made the new driver.

For mt6323-auxadc, which is the closest I could find to the mt6397 
(CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14). 
It uses CON22 for its request register, and reads the result value from 
the same register as the ready bit. We don't do that - the mt6397 has a 
factory calibrated value for each channel at 0x16 higher than the raw 
value. mt6323 also has a 1800 mV / 15 bit scale / resolution while we 
have 1200 mV / 10 bits. We also have some per-channel preparation that 
we have to do before the burst, that the mt6323 doesn't have to do.

For mt6359-auxadc, it has a more generic framework for describing the 
AUXADC, but it assumes requests are channel-per-bit, and so we would 
have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.

We also have our own software sampling, which the vendor does too 
(Amazon Fire OS based on Linux 3.18). We'd have to have our own sampling 
callback to do it.

I drafted two other versions of these patches adding mt6397 support to 
both of those drivers, but the differences meant I had to add a lot of 
extra boilerplate to each driver and to me it didn't make sense.

In v2 I will add the justification to the cover letter and commits for 
why I chose a new driver.

If you'd like me to instead send the exploratory patches I made adapting 
mt6323-auxadc or mt6359-auxadc, let me know. I'm fine if it ends up 
seeming like we should adapt one of the existing drivers, but I think 
the mechanism for controlling this AUXADC is unique and merits its own 
driver.

Thanks again for the review, I am going through each one, and sorry for 
the delay. I'm rather new to kernel development.

Best regards,
Ryan
