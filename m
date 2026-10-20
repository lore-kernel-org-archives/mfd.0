Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496250;
	b=iFcbu2H9tZRDcdS899ytAQPABISEwqaW7BW4eVpfT7w7yLVcRSGE/sg49SwLfjsPTJRr
	 YCZEcAxs2u5n91apQvfWn27nBdvVd8MGllRS+plwnE+lDQDd5A6AjKKH7ueqMfSilrLQ5
	 p9Vi2veW+vbm606uuihCvef0gpYpry+0Tjkx2fHcirpTg0hhHK/NdHILj2JZAC76GJ7A9
	 PyrWIMHTYNzF9d+5k4bql3mhWSRAaJZGN3U04caoaTlUlzauUQ0hUcRGTVzcyfg6WxZ+l
	 09gDQUMfRlFi7RhzoL9SuNzi2MIT7Eg2I7geQF1V3wfll3XmehOvgAQe4f2Y4TLtKYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496250;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sVGCrsIumhh2rykiYI3oYotV04vbs8GWIlWmVOoStJo=;
	b=VxnNdvdlgwmfwbP6ofL+AntUNXG7QDFVI7h38/CqzsFQMqf9ivRVnwMvZhqeg20hErN8
	 BXv+00YLX8pmT4F43cl3z2u8lSXqZSbBY3nT2X8n0LDJZlD0NYIS/goOtTI0IbpYTWGK3
	 u1Ooriih1b3tCI0Q02IL3WX9ahXheYQZx4yAZulpo7TdC30RLx6FEBTWHFU3CfEVOKNne
	 KC+j+58YsyvibpIjYk7vqhOstJsJm5wkKMkczn9nAtjLlQp3N8bfx/iVjJt/pAznMthJA
	 PAHlTNuWqo/tQGNypczhgFaUbc+POjX1kgT7pGpoPiXTp6Fo2KVa6uu4cvepuloTlXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WU/4G7zp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE1606A31A;
	Tue, 20 Oct 2026 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WU/4G7zp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A168F1F000C4;
	Tue, 20 Oct 2026 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792496249;
	bh=sVGCrsIumhh2rykiYI3oYotV04vbs8GWIlWmVOoStJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WU/4G7zpnaqjghzcAOdSwlv0am7CrxFwc/lFlbLZbnk3yDpJGmbe9Xecjn7+JyOpu
	 BGZwtxAtS253mXdMUzICd2IQC3LBZs65pesnDnFppXjdkLrrbWOFqI9eYjYwY/cs3n
	 IXcHws5PrDCq/OK7X0whk80EmBJlqmOx9RxMtLn8o4B+oKi4l9BrMPQZRJuA2T5loC
	 rNf3M6/+QFwunTOi+iQGppaHIOIdQI32rrppEE5P4BC4sDMWg1rznYiMIBPnhkS+g8
	 KOhSvlDl0zUw5CCH3XRK25e+ZmJr1i+mqWpkhP0Rd4DFtBTYTYMIrDvoTNgLMqQVZO
	 +ld0AktKd845w==
Message-ID: <6e2d6ae5-20de-4f6d-9403-fbd2f65b5371@kernel.org>
Date: Tue, 20 Oct 2026 13:37:06 +0200
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
Subject: Re: [PATCH RFC 2/5] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org>
 <9ee8a8f1-5e32-4ecc-80dd-027f0424fda4@kernel.org>
 <CAD++jL=_FhbjBCAZKTa_sBLT6UX+xL4kaHmTCE5GAOJf__2tnQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAD++jL=_FhbjBCAZKTa_sBLT6UX+xL4kaHmTCE5GAOJf__2tnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2026 16:03, Linus Walleij wrote:
> On Fri, Oct 16, 2026 at 4:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>>> +    /* Called PMB Processor Monitor Bus in vendor tree */
>>> +    bus@ffb20100 {
>>> +        compatible = "brcm,bcm6846-pmb";
>>> +        reg = <0xffb20100 0x200>;
>>> +
>>> +        reset-controller {
>>> +            compatible = "brcm,bcm6846-pmb-reset";
>>> +            #reset-cells = <1>;
>>
>> Anyway this tells - no resources here. This must be part of the parent
>> node, not a separate device.
> 
> It so happens that this bus (PMB) has several children just not defined
> in this series. (thermal, clocks, power domains).
> 
> One of the children is the thermal monitor, which in turn is using a
> reset from the reset-controller node, to reset just that hardware
> which is under the PMB.
> 
> At this point if we put both #reset-cells and #thernal-sensor-cells
> in the same PMB root node, the reset resource would come from
> one part of the PMB to another part.

This would not be a problem but hint that these are the same device and
we try not to encode device internals in DT, at least for simple devices.

> 
> They really are different devices under PMB bus, but I'll just go
> and implement thermal sensing in the same patch series so
> that it becomes obvious what is going on, why not.

If they are different devices then it is fine. Usually people cannot
actually distinguish different devices and they represent driver model
in DT. Bindings are also supposed to be complete, which then avoids such
questions/comments as mine. Commit msg or binding description should
clarify such points.

Best regards,
Krzysztof
