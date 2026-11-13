Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600213;
	b=MWi+rkaFkbcIdhHStd3GB3SdQ5NuH/oJgYGtfJDFrqOxvaUEQqwQ5+CDkpzoDeAQawln
	 T8CkMyj1ChaqmeHrobNCtEpjnCe6suf0S7LHSATM1JaGcnfkagKxULpRHZGYx/V73Cf/L
	 6t7pHbFpd/PHMGwM5/cgvFrg/8CTmiDNcfZBFbB/8u1iaAHs3WqgiZnZbLcW4tcqbScsZ
	 9XlSVbVTrA0/4XusA1Q2USVmMgI2JBEOQhI55ZBda1kMDgycZX+Zo8UhYGcuOTrwwJFSl
	 LRahPgDgxXJ3PqrK3J+AQUctuHYHwVbFVRqGDWSKJKAX3zdm6AvpiqqJ4vUKyX+Oe0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
	b=i9/RNCVn3uddQC1VOS6duKHIe1QSyHu2DcqTjrhibYDUhCHLsW74o5KK2nZb8iFtLjWG
	 cecTAcbRdO0C906ZGf3hflMzetYuGk+wfBkuWJbuQ2bKceozYUqANsi5KAKGRoQ2Aj1cc
	 JcLxnjqGA3VlIfGIHbuneos5g+bbRXNk4Uwg0eH/d3fPol8x74xKKTFvuOS08R2C6Rwsv
	 KcUgNmXmBEUj+xIGMfpbKk9rRqGUJPPrkZnfZzEeF+2U+JSZ2Sedsj6KOSZxM65U2uc4E
	 xpFw4vtqnlAc/ihyJ8wdsu0iIY0IagofQfgXM8u2M7W7eeUx8bF1dqP9RMZelHobLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2rRuUpP;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01894606A330
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 20:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01894606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2rRuUpP
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6ddeba3e85dso400449eaf.0
        for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600212; x=1795205012; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=s2rRuUpPRKs0KEUf1STIYivhND/j3zCD2uusMeA6Agp2bzCphnQVIVj7/EQk8iDla8
         OfW1e5pJlK+s4SWGXXNcTm2eJEW/hisKqfMuUrMuTlGOnVMvw7lWakOhnLciY2we0gVE
         BuzWDP+bEXlbCFl9ZBbZJa4Nqud1hAJ18PdsLZoWDiksRom47iIDLf7axDIq78tsm3CK
         6pgzBcfYm0hyhfrnkx4q++H4grnxMeNuBJAvClcPMZYGOPsufi/F5BV8LDVDAQIe+Frv
         0MKwmoBYGKWsQ72lZpefVyZ9ls+5Jhd1U7UfdpYYMcTXDQOBTbAbJPapNuAC6ZnXqll3
         fWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600212; x=1795205012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=xObss1m2qrQ/Vo/0mvOliIps9eyQ/j0E1etsDQYR7sGF/4zwoxW24AqzNnsLVtNysr
         K1nqSHNZNO87V8PLf/ZBImxPqjMuOJlad5R8sCJDuU5Ae5BHFTkRpXpSorOzCtJglDJ5
         S7v8KOJFGE7C1JBYO9YbN0+Ip5c2uBJFv8yoq98MNT/2F78h8lWDa19GnaC6/hhuuZ/G
         ijN6nJkGiFyZHkpOwYg8jCFE+y2Dn8q67LL7HsiOhxFg4rtbGmWVdg4KalORuYyayqoe
         rW5dxAdXfMh9c8BfCWudu0Ltm78lAO8wrGLs3jAWXhYxLIBjhq68MoXunSmzP2yUfsHo
         /Auw==
X-Forwarded-Encrypted: i=1; AL+hErGGIPwxo4Nob52SZLDR9/VqoDS0LlLmlkpmROwq7z4PHmICFiONFvBvW1S5LaW7Rc/tATQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9P/2YT3uB1bO767oPMRhLZztIQAqsu/GITGbkcjQ3Tn8OAwwX/
	mV71qrCtXTQeuQ7NT1Nk57qOyjC2tpetatF3WCq2P1/152Ln3sDM14IZ
X-Gm-Gg: AYBFou0hnu5m85VpFfWLzq7YoIaM7hrgbfByGLcefoBDcbRZWrFqFoTkn+1UHKg38CO
	YF2FphyYmbFp5DR/vBLYF6cfc58E0n3oYlc7K+sc84rZ4gCaHAtlZAhisHqs+Rg32/hU1knr30H
	EFms9E77n7RzsKkfm6ozsVIjCK3SI3lHHd8wURU2r9Nbk0MrQz4gR/r/dmdOx/MKbEkyN73JYhq
	lrec1UoacXLUk1s2KDw32x10Xi0BBqsXLMiZggfte5/1e03OdKzHWLL9O+0Bzl3/MRBre7B1z6Z
	Ki8tcnZHVkcnB5a4gy5oIe4Hj7hDI0W9nzEZRTg8egQcp3uW4tmSlYlERYAFXvuRus+qgr1SBAo
	XhGQNGqjvQC8SFmmm71Z7RnCPkbGlFQyh9MYYd5dhVV0i2gEIXFAAz7dOSv/VuF8VId0+Z/CROd
	xbWgvKjBhie6m66cg+wm3MVTEif3Iw6v5VxEBb97AissiScRzhtLKUbP1ZFQy7oDoWCUHuwjGus
	1uS2pMFCY0VfnM6Y4GqmpVojxmE8oyNyvxrb/BN/e2FGk2xfraQuXcjfQF0AvE+/aVpTZKOCuj1
	wI1ohXgon5zuvcrtKrqUPrLwNr3o8W1FB1QtiLzc3KSVRVMQrPEov3HjJHLc+TXO56yWNaSdG4h
	omWwhS2adghA7JVnsvdk4fnqfaUpfTsenL02S2TRm
X-Received: by 2002:a05:6820:f025:b0:71a:ce4f:4a86 with SMTP id 006d021491bc7-71ace4f7613mr375277eaf.56.1794600211873;
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4335912sm2485972eaf.13.2026.11.13.12.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Message-ID: <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
Date: Fri, 13 Nov 2026 14:03:29 -0600
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: Lee Jones <lee@kernel.org>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Lee Jones wrote:
> On Sun, 01 Nov 2026, Ryan Brue wrote:
>
>>   
>>   struct mtk_rtc_data {
>>   	u32                     wrtgr;
>> +	u32                     con;
> These are terrible variable names.
>
> The nomenclature should be self-describing.

Hi Lee, two things:

1. I have a v2 out [1] from early November that fixed a null pointer 
dereference that Sashiko found. I can spin a v3 or resend v2 depending 
on the response to (2).

2. would you like me to update wrtgr as well? I can add a patch to a v3 
that changes that name in addition to con.

[1] 
https://lore.kernel.org/all/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com/

Thanks for the review,
Ryan Brue
