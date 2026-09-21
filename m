Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5C823EAB4
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950136; cv=none; b=WGDRNWMHqgCr8NImuJstGowiqCkLAtTeUVYlBtrGnrBLMer6TnzUCrTJz259R+6pwpr+FVt1PLA/TvGelSYCcs0xEPE+BE/lLF9NNJ52Q6R+a5YF0YsCq72HnMY7pO+rc197pDgDU0Nfy+OomRZjzMuxHSH3VVn/ae1I4xP2+RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950136; c=relaxed/simple;
	bh=XwsRzJLQL722rDOxKBtIkGBU0anBu6ItURQT6kz124Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFPB4shLkA8RNb51lXJbLDErJO6ujrDR1sSMGlMgMvdvp3tAEaRsmcnaqlPVoZwAkWnpm1K5YNITEetoJ9K6KGlWA8pCFcaawXzUTTK1rAFM5DPgLvo9X7Rvp1Ra8MJLaAe0wSeNbGKIbkCYnC9cEMfigHqSMpkQH3uPvDFLLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3U5A7ij; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3U5A7ij"
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6b1bf394d3bso444455eaf.0
        for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 17:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950134; x=1790554934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=j3U5A7ijcHazGzfeQYMr3lVEOJeM8l3Ljve2x7IkFtG/iLIlPbJi3R0KyM9Vjq3I8S
         12q00Cuf4Q9FIkBz1AjOgx9t8LlK6Cn9Y8MkRXBdiuWsWmO/c0+5Iij7zllIX3or3n7P
         c6iRzs1+7RZcLvjvw7MOKuVQgq9/xnIgS/nTk17PJNKn16OXGW0OrV9LL5jn0xh7l00I
         gNOPDA2+g1C5zsgC1hZaOAQ997nv4406d6BrqemVHoasFMchB9xEBYNhWd7xrjaOYKNR
         mImcJJtv168yYOva+ThespKVZkwuUGEesaYviTechx+qKLcYlMCDM3/BKxdmfnyPiba3
         fkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950134; x=1790554934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=FiNrAKIxf/oHJGyiIIUqM0uyfuel8AmhrvMrphV3qhu/YfauPc5VsF9IRTonIo5TC9
         0+q6QnizqOvJL19zv76vIpMz0zRC4D2EOF9dI2Kl81vPMB+qa5v1cj5sbyE2Xlhp+gyD
         6Xk22Fr+OG7Iaal+uJ5MzCaLTzKRHyjLYMcj7EB6fLzFYVnKVRDeHPJd1bXPzBZyU9f1
         A48nG5B2xvCe6jYanGYfwO7dMW7JGn9vLkzGvgLlsS9fjgCKgsk5KaRLwhblxExaXQBN
         Kqq86DVcPkMNZmQefMJRjRefaE/ff+ZiG9RJYewpKNaDDgpt211Xxi8wrvgPrJqtFiYn
         WqiQ==
X-Forwarded-Encrypted: i=1; AKwUvByXhQFgoHd+1SY3wFl7OqPMrbru5jdcCDHVtkenF2G7wMl2l3QF1thY8W3bUNgd0WorTPk=@lists.linux.dev
X-Gm-Message-State: AFuF++l5wEpRNkUMNfx/8mv69wKKBmbDf1ce5C59X4vse20L7acDPbD3
	R8EYYPDOpw2t54Tj2ThyPbqD2mQ+O1Ei7s8cf0CeT+xbbQGkzPbIXQG0
X-Gm-Gg: AYBFou1L298TA2+EFuHC3+A0GI1iKbGYoJpvDC6s0MXOT9FRcyL49ibNFI4oUw+h+r8
	FetKTU+bpMHK3KaQkCVjCj9n5LBEvD5q/xvH1XNNxzNTdYayDJCvmSFihFpUWXqIhc5GnndHTvO
	SW30WZhVEIW3tzvfaUZV2cvBrS/dDeHxJhguw4DFoIsTwy/0CfrL3ZmX8a2OKC8vduMw4OcOuA2
	Zkr3EoX8N+4uINwuTVa9cgDa3sRICiPkDXMihkPbGg2qkxXt3YBCZXwx70Y7z0hHVIkrFJCzIpK
	rfPkrVL7+MFRsz4qckq2VAO2Z/wseLmFsFt1zaGSKRkdjFT1xeF/IitQJEnONC91qKTvxACdd0y
	cQXhjnFAtqfLONFCTbmx+dIumEo2IH4sVUOoFu+qMCReCNRvXzw2BrUp8Dx6CtFBfkwfIWIIb4/
	E49YTiXp6/iR5o4CzyicuHyzLd6B5ZRswiIwt7jsmP1gzvYum4RdAAINZTUcKDE7+3KlbWOAnos
	ferEMcXNRfVax0=
X-Received: by 2002:a05:6820:1f04:b0:6c2:1018:3f7 with SMTP id 006d021491bc7-6ca9aa4245emr7824820eaf.23.1789950133885;
        Sun, 20 Sep 2026 17:22:13 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd34b3101esm7471632eaf.6.2026.09.20.17.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 17:22:12 -0700 (PDT)
Message-ID: <41503126-2f2b-4ac9-bb9a-610686be4729@gmail.com>
Date: Sun, 20 Sep 2026 19:22:10 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260921001702.3a208780@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260921001702.3a208780@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 6:17 PM, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 00:31:50 -0500
> Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> Hi Ryan,
>
> Please slow down between new versions.  Unless a maintainer is specifically
> asking for a quick turn around (sometimes happen very late in a series) at
> least a week is typical time to allow multiple reviews to come in
> and hence save on effort all round.
>
> Jonathan
Hi Jonathan,

Got it, thanks for being patient with me while I'm learning the kernel 
workflow. I'm sure you guys get a lot of newcomers not knowing the ins 
and outs. Won't happen again.

Best regards,
Ryan Brue
