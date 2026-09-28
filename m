Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBAF4E9C20
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610856; cv=none; b=eXJjHkOOdf9rOwG4vcYH2hywRoyVjkVQRjStwxn8J7yutbj7Akge71Myn7/FYBtDQqirtKJac+ZFol3QE9ioVb+45BJirLsI4NV89RSMIqY1A3a4gleG6338MItjE6Mh+VgeYP5ixtYCKmaICl4XgeoY53FiWuexFa7neLeGng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610856; c=relaxed/simple;
	bh=btGCnFhlcQ9Tjp2kCrPOIBm9c9H5F/PoS4B9XE+7z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXISDQ3rum1zX//JPL8d0r0F11KirUhu9nxd58aV+TrfdEAykb9f+Fsdxqa3qHdPF0EXnylOIKaBAKuttm0W9hWi1TSBNrSGe3lhQNyQjPPE16So+hBi7xSoCR53kkbMace/lDAH/BNUwzZ9GNhrVTTtlAQC73EFB5SaOJQ6zps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UD0JT1rM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UD0JT1rM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2582499f8f.0
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790610850; x=1791215650; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=UD0JT1rMrfEbAu9CmbFXI/M9WjzxD0qFcyXUIGx/IbPbtWC/sRaBKr7m3ZmPr69MVL
         0l1lWcJxuf9L7LaA98rvr9EQLR7sLrACFkOXhDxdU/864PDDFNfzqAge5H73b8vVLjd7
         ivQkkA9a1jj8byM5Ca2XlPuDW3zKHYHY/p025RhqPBNHpzZseKKzeb1DOpL172wjMYJ5
         37ZgUvjt71YMTDiV7OIDRimqOR8xMsfanpOHfkdQPHbkYD0dhyj7iKSw5AjkgoDGAkf5
         48NhqyWQprBtfnznYRgxfX1NCCfOuxmTOTn4qpTQodatWOXtmLQMPwztcibIb1nkmvHb
         +lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610850; x=1791215650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=qbNYVGLp/WYEeHyP5Qli+hEZ+FMJ28rH8dh5XZkc9BCMhR/jiqWJazJvdhbyfLQKXm
         LC+BiUp1nZIhsmjazD5mGA6yhpxD2G5LSVSmkyCGFsWguOTcvvtYt8EicifUmlim5Lij
         bABRNX8AiutBAAcPw90Z90GHS+tuhFgNFYyctNrdQfxETfBjDsptKSiYxxYKmDrW4r7O
         RSK0r0VKSBgXHXqiYV7gOJb0KVIT7qgnfCuAqUjyXQXGjGa+r+Zx2WqUxNFs92cq3HFK
         7ehmOfUDstildET7kTuZy0M1anOCFgD+Om/LSJYUHrAcJmCMYzfrgRkOHoMXC7D+/cI3
         NkaA==
X-Forwarded-Encrypted: i=1; AKwUvBwn6fBQtul6RMr5erDTtp4vkrEwJ+oehJMe9UcuvRU5paDpKJTmn5dzDOXAqwjUQgYqyF4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKElhGUF7LmQq415C/eUnhQew3SKCD4UzejALh5C8QbywIiDbhh
	5eioIa84WhL0iOAK5XwHZ+pETONKoSDWGZMv69MUHZMA2szFeZNeDtScIMyN57Ktj+I=
X-Gm-Gg: AYBFou1MObatqi7Qlz0GqUDOuiTHKCc1Lf0b6/3lznzmcDqsdxq+2jkCPpLCaepr0Je
	RjgwtfJHK8OT8Wdnx++uAtXHv/D1gbQkL/IXRzWu0Q9htSY9jkgMvCdMNeVz3BiHINYvFCbNl9t
	QmuPuObKPbPkLlFTAy0jvjKsk1BNPEsHXpfs6foj3Gs7YijoJUnzmSStgh45q90Pg7UYCXCUDWV
	ipUF6pTJiG53DZWFJhfHgvMi7YRpOX/6EuMiaTMT08AeP8VKoy4w4OG2B4Q1o9TgDL4LU5Dv1fu
	XSRWcOseLApsrdPSLLlcv+VHJADKmvuuYsEoUUMoBTzX1qkj62tCEuGVWnvifDOuHQ3jl+JO3Up
	cnxreg9KsoY+hvWyscNGKsMfrctYxAKIme3Dk9+5v4H1Ed50Nwb0e1e+3saEB812ojUSaRvdMzo
	Z0fioPn2qNmiODx+wHd41T4Fl/AUOz9WjgLqwCKh2f/5pc+78LoySiT6yiZfdrEXPFebD9LnW2b
	9Nw5plvKb8ZVVFcpao3MIA=
X-Received: by 2002:a05:6000:2608:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48884baaf4emr13756148f8f.0.1790610850114;
        Mon, 28 Sep 2026 08:54:10 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-489bd7b1df0sm7993153f8f.31.2026.09.28.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
Message-ID: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Date: Mon, 28 Sep 2026 16:54:08 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2026 17:33, Dmitry Baryshkov wrote:
>>> One major comment. As we see, on SMB2 PMICs parts of the Type-C
>>> functionality are provided by the charger / FG device. I guess that on
>>> SMB5 PMICs we will get the same problem once somebody tries to implement
>>> additional charger features. Would it make sense to rework the PMIC TCPM
>>> driver to be a composite driver, taking several components via the
>>> existing Linux interface?
>> As this gets decided from the QCOM side, I'm fine with whatever suits the
>> hardware best.
> Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> components be fine?

I mean maybe. Would it not make more sense to land the TCPM 
functionality and then look into adding charging moving then ?

i.e. finish off adding this piece first

---
bod
