Received: from mail-qv2-f35.google.com (mail-qv2-f35.google.com [74.125.230.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0914331EB4
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110938; cv=none; b=RA3PvnS1F8o0zlZQBS59XFGaHe2V18cwLmSxixXQ9IPZ7J8m3EXphg+k9KkuNwlFXnuTfjIHOxjBKvTUgeS6kxGxagq8Ko0ti7bZlaLsrOtWd4SUBGtyVS3qmKH82QacG2W9TLSiPZ8BYSSrPAtJZMIdt44tNA6e4SqdkpNElsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110938; c=relaxed/simple;
	bh=mUiTpuXZ08jRjcCjuhENhAkI/h8z83dpTQbKz9it2Yg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rk2DSH+4R6hXDfWWtCF6r3zoXTWAfWnQOu/j+1/iBEOoWb0tGPBHQyOQCaoEj7qjbkz2Bc/MfLzDv4laH7gw8pyhIgEeHDftwSSoKgEd+ma87hHnS/RhJq76aoTPaNLj2u+4vGOYjSynPFSzb2GtyVQ9nYSf/U251jQMsCTpyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CA1Iw14v; arc=none smtp.client-ip=74.125.230.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CA1Iw14v"
Received: by mail-qv2-f35.google.com with SMTP id 6a1803df08f44-9104e54b1abso3511156d6.1
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790110930; x=1790715730; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=CA1Iw14v1lOfLvC2mzQODGPqsKtro2ZAOYuuwvLgOrl12roJH3dE9xc2JOvQtaYAKD
         eWfCcYhz73Pch59IhNAY85fdlnFtFRTJz15xPD3vy0fDBoyDz5XNp7drHyK88YN85N2S
         WiFNdLyO5q36nwBJbnAq6+FZHCKAZnQD0J/1T6Ku+rFBvMgar+f39bAUXM/18kcgKXSX
         tTDqoL0u2h3QxZgDBB4qZ5BqEpKpsB7NVgTlVpOK+nM3d6RJr11xLwyDKlxkFLG7B/RR
         DC70HguuiO9/ofiUjOBcDmGASKS6uAkya8KhXdddDuCbpIMSpEJHXAQgIg6FXMkZV0EO
         2Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110930; x=1790715730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=UhIhkMoFWjxtjs+K1Iq13uvZWduD6IpxyHmDvy1spAMfON9gEhqB1iwp3fmoIiQGvG
         Zo7eTl9folRbWOToYr/ldtEzFPQ7D25kIzCpMP5BK/JeL1Dnk+g7yRLS3sRYiEypSkfK
         O9Jbhxy8gHyf2Q2OfD8+kL3cTR7B1aMMLttMKv9x9YyZYRIAcxnKZu//OoAdiNekL+OS
         gNINCFdSM3jGpJwlRrgAoGadVPEr9K3px6f5HMSnJoyvrPfF2PjqiA06niLFizr2qUOM
         8Y0/jeHkh3fy+PkFrhzutRJdousvKYEomRPtapuNTER3upzGA+33+xIaCeKkW3Ehv1Da
         7ZCg==
X-Forwarded-Encrypted: i=1; AKwUvBxdKwIBtr3VSxp31cyv6Zxe03DW5EkQ4HymfdvMDgd8Ay7k1w3+14EyHXO9yBWRh7Q8lj4=@lists.linux.dev
X-Gm-Message-State: AFuF++nVmGMkxL1wFtXpAyZuf0euK+MD20hXK8Rx4RE3s9BAa5zeLvbh
	xWJyDkj42Eb/sBReCqA4thMxg3i6MZScd7mGgiQq+nMxG4fmf4/h9jip3CtlQX4NPTY=
X-Gm-Gg: AYBFou3HwbK5TPO6Gjugd0omEZVgfmxHkPQJVBDBPzS+CstTroVmLR2fJrQIkkZYIG2
	eNxXpE8+cjk6HLXREMI46zwZceqqprYFT95LGuAY7vLupLm1sJtcHbyOz394x85vSxwq4R3u6ZI
	HHOrwCbFT36ewQlBDzXqctgATXlm26np2i1Tlkq+sV3V0i4TSyCJbzFxbow92g9Q+O/+xds8GF5
	nTOtVIdMuFLRTaU1JHlGXB0LumxBoYpKRBNhvUwRNIyWVOqpqErUv0UXQAAGcnauiFj8N5Mnhie
	FSWVigX5sAelWGCEUxGmVq2aeB15K0Ldo7MmwjUPJ5szp09J9GvZrdIAqYHhMOhBGf7ThSZJ5ZC
	mbZAe4KBKBCLVoh3yePNzVrp+OniSCyPJTTNRaWben71uDMoVhHqaNbL2xKbFbEGHcsdIjc4LWM
	ExMSbTY53tH5Vdof3IVUlW7IJJI66MzXswSYmx/j8w3xiTC61JOYGVfBkv7RhjOcaQZp7qE80=
X-Received: by 2002:a05:620a:2682:b0:93c:2419:37d6 with SMTP id af79cd13be357-93c252555e7mr100858985a.66.1790110929661;
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm69157885a.16.2026.09.22.14.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Message-ID: <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
Date: Tue, 22 Sep 2026 16:02:07 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
From: Alex Elder <elder@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Language: en-US
In-Reply-To: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 4:46 PM, Alex Elder wrote:
>> I also have doubts that this is needed - I see no updates to the misc
>> binding, which would be referencing it. But then another point would be,
>> that you do not need separate child node, which has no properties.

Krzysztof, I've done some additional work on this based on
your feedback.

I think you are correct that there is no need to define
this as a special syscon with its own compatible string.

Instead, I can simply define a simple syscon with a label:

         tc9564_config_syscon0: syscon@0 {
                 compatible = "syscon";
                 reg = <0x0 0x2000>;
         };

And then have the devices that need to use it, refer to
its label using a phandle:

         tc9564_clock0: clock@1004 {
                 compatible = "toshiba,tc9564-clock";
                 toshiba,config-syscon = <&tc9564_config_syscon0>;
                 #clock-cells = <1>;
                 #reset-cells = <1>;
         };

         tc9564_emac0: ethernet@40000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x40000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>;
		. . .
	};

         tc9564_emac1: ethernet@48000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x48000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1074>;
		. . .
	};

That simplifies things a bit, and requires no devicetree binding.

If you think this is incorrect, please let me know, otherwise it
is the direction I plan to go with the next version of this
series.

Thank you again for your review.

					-Alex
