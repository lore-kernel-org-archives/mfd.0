Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312179;
	b=zo3PErx5BUZHwFDBxSCm4Vw4xH861gwtIcQz94VbNH6zs8McK1EEEz8GGn5iUyePAAhe
	 /H/Waj58J8FqAqzdTyobV2mTfyxtbTmL+jFAhGAQW+Ydrjy6WjROkYPxubkyoE8tyZ3QX
	 8rPvDZaf2XktzBb+wqB63eFptfvOnmvIapmM8b1LiQRsLCpfuM5Yeq9VcTUTmolqGaRis
	 bg2cGMJGshV12X7DPlej+Uh8dur6TL7J0aOV7aebbr6lbJxjlGfQZuBB6cHoQRatg7t1r
	 DJGMJhCHh0SDOt9ZZ6NCLzPuNK1VhH9r+/54sX2eiPpg6ERs4ShfUgGT8xfBNyyeluQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312179;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
	b=KinSe0ihTj6YFtWmQkqMtO76Aggomx+F7l+sAEwihUWKXw7PKEd8TGYae3OEB6iLIeFB
	 bp5PJTAH2ZLbXckhpzLzoJex0ZgI0Pf7Dryw3uE1x2kpHFwzBulOe2Dc9Yz9B/W2qLLU8
	 jDpvx+J20oae825CrKTQvDIxfqzGxi991zoRIJagKEc9ylb4Tzn9C5eAtc8KOEfgQHUPi
	 MhgcqGTsahXgv2cbQvQcWd7t4NFTw+Id/aHaDIYpUocLAGGZcUJRspp92KLDC068UZuzP
	 jp9WLeh0v4FHW4yRFHMzwB5v1nAJJEjjoYz8LqhqI/AjUi+Bss6I6AN3fMszyf+FYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hwW+bmnD;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78F606A31A
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 22:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F78F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hwW+bmnD
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so45357a91.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 15:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312178; x=1793916978;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
        b=gjM+pjtOoOEantwCPCd+ds+Te+rk9XUoP+XbfuIA/kwlXGs4+vEDE3iRsZ/DL0dX9o
         Djk8IhUTcqbAZ/LE7e0zeiJxbMMlanhWwWtuD5pu7MSZpbRYRbUYfEHu8vgirTzswRPp
         ctj528MOHXnFvfFd91nVJItyhG5fijL7wqVrKQdacZtwgHvPSmpaemjfCspkru1R8gyM
         4w6zqkqDwl587hTtkwBZxuyESRNceZpEXqPIcwhhzHRHwLTb5XMivI6E+dHo98Kz/v2l
         i4MCqJKQBfX6+AScezgIMsSDbdooGnkM7Z62CU0pgKA6q499Ekn9wQemIIMOyUHihi3U
         lMTg==
X-Gm-Message-State: AFq9FYLzhm3tlHKmwXXk2GhrV8dOeaKJ9NfwHvge7tdG2FySjf1XrUue
	DsX54j3RvfVmywtjeK/jiSXkEbfLJI4aTS0OHAxiM8TbttJeuyir+02Eq3ygQnabK1D1TJDoLUS
	I3rZBK1B+Q/U3DDe8SH3qmB2sjqm8JdROC2WpCHJZPO62VBnM8AjNVdhvESkoi1qzakrnQeSbH8
	6/hnYOA0lRhQ+Ahw7mvPdZVs0CRT1FnwGXVPPKudrj1IuyhTOk1gi6akiiNGA7UtnZ63j7BquIU
	0SBmHL3jigvnDI=
X-Gm-Gg: AYBFou0tSIsGIc8juaoSYCNetnZ2kuAtvXbv6J4oLB+LgMqWUAP6aoKjCjRyVfzulun
	RF8yWMPMMBH204RUvpo9g958oB1ITGIKa76ZZDRS8qNvcB04v6tZLb0eCXQ8zYRQqtw7CxvZg8n
	3Qto3iCyu562unCUR5Dv5bNaUYEF7R/gCZgt7CcezJIzU89yybW421Eba67+pQpoxK9O/7RGNRR
	QtqHh+amLP/V8/5g8HWkqRDT6E8Z5AFOKD3MIjcb0d5UJDWWH+9klLX0mxfgUduG8HntWW8w6fV
	0WW+OUqUmcBtT6tfIsdZNfHh2ETyKFeJxh5I35vpfrgLQQnJ5WtECawXmk0pqWEKF8YN+dtWSXd
	UCLYTMu6YSild0rfqfFKVZZnUUVKr/zDESdJ9AbB+/3/F7AP08rVrOmmbngbbztXXeZlvYyZdls
	UZK8U46sJq99Yc9Qx5EgYrfIsgWefjKm6Kc5lFX4fs
X-Received: by 2002:a17:90b:58e3:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3ae897cc9f0mr247912a91.15.1793312178475;
        Thu, 29 Oct 2026 15:16:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e803953sm2874903a91.4.2026.10.29.15.16.18
        for <mfd@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:16:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9197553d398so2760256d6.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793312177; x=1793916977; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
        b=hwW+bmnDi6BbkS/pCe4/+1A7lWLaJdFAXT95O/JLPsCENcwzsr3LxMfo4qG9Wh/OUC
         +Cy1Gg8koY/kfX4rW09yGtBRJcQDlRtSHnJZC3KZ1FfqRKGr98V98BSQSQN1JuCePyon
         vVzRb2FLUTsiR2LZuXH5Rg2FASUoN99cFdvhI=
X-Received: by 2002:a05:6214:320f:b0:91b:80ac:66ea with SMTP id 6a1803df08f44-91ca4b09275mr5811926d6.24.1793312177158;
        Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
X-Received: by 2002:a05:6214:320f:b0:91b:80ac:66ea with SMTP id 6a1803df08f44-91ca4b09275mr5811296d6.24.1793312176571;
        Thu, 29 Oct 2026 15:16:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca689d34csm198336d6.32.2026.10.29.15.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:16:15 -0700 (PDT)
Message-ID: <04b60565-5aa3-4859-abc2-0291203371d7@broadcom.com>
Date: Thu, 29 Oct 2026 15:16:13 -0700
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
Subject: Re: [PATCH RFC 0/5] BCMBCA PMB reset controller
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/14/26 02:48, Linus Walleij wrote:
> This is another of these big upfront design binding and driver
> hoards that is the consequence of adding new SoC support. My stake
> is to be able to boot and test a full featured Cortex-A5 system and
> the BCM6846 XG6846B is one such system on my desk.
> 
> It's been cooking for a while in various prototype forms.
> 
> IMPLEMENTATION:
> 
> Add a shared Processor Monitor Bus (PMB) driver and a child reset
> provider for Broadcom BCMBCA blocks. Support BCM6846 XRDP and its Runner
> cores, PCIe0/1 and PVTMON. The PMB bus driver uses the third generation
> Platform Management Controller (PMC3) keyhole interface. It owns the
> register bank and serializes complete sequences for child services.
> 
> The fixed SoC transport is built-in and has no sysfs bind/unbind
> controls, allowing delayed recovery to retain hardware ownership
> until a busy transaction completes. The reset child can be modular.
> 
> The series contains three bindings, the PMB bus driver, and the PMB reset
> driver. Describe PMC 3.1 as a simple-mfd with two system-controller
> children and a bus child, each owning its register window.
> 
> The bus child exposes the PMB transport and contains the reset provider.
> The parent uses Broadcom's "brcm,bca-pmc-3-1" compatible. The PMB and
> reset drivers support only the BCM6846-specific compatibles for now.
> Other BCMBCA SoCs have different reset groups or PMB interfaces.
> 
> Use one reset specifier cell and define BCM6846_RESET_XRDP as ID 0 for
> XRDP and its three Runner cores. The vendor sources describe individual
> PMB device addresses and reset masks, but no ID for this combined group.
> SoC tables map IDs to blocks, register values, timing and sequence
> callbacks. PCIe pulses preserve lane-selection straps. PVTMON uses its
> analog-acquisition reset. Consumers must quiesce every affected user;
> these resets do not replace clock, power-domain, PHY or UBUS setup.
> Power-cycle operations for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL are
> left to power-domain and platform power-management support.
> 
> This series is based on v7.3-rc1 and is a prerequisite for the
> forthcoming Genexis XG6846B Ethernet support series, which works.

Excellent, looking forward to seeing that!

> 
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series.

Very nice!

> 
> MISSING:
> 
> I did not add MAINTAINERS entries because I don't know how the Broadcom
> maintainers feel about it. Tell me.

I have no objection with being listed, I am more familiar with the PMC 
present on the 63138/63148 than this one but having access to 
documentation and people helps.
-- 
Florian
