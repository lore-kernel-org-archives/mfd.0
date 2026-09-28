Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4F4E2F33
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607144; cv=none; b=F+7CPYhbqqLEfb9u0V9Nag5IUFoYJjsNqyD8dlFjizkMCkuwbMQCtj3Gz6zw44arhaLGKJGtfL5zDAWYI38jylSW5RLuAeKAB2qmSBH8g6PDMu4mUO4LCpp2wlizKcRNJdKVFa0UB5/9jpMuovWYSUwvlSWnpwHkprUjShaz0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607144; c=relaxed/simple;
	bh=gbzmEAe7Yh7EOMgc4+9QLCGtiswt+t1xIkHm6+slPpI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BPwbHdJ3oTuCERKmmuLr88zpvJ9u89SekKbmHB6096LREHnCOR7bu1O2geref+pAWXG4yIdmMt+0G1uCq5hpJfnXqb25XBFpkXGmzj8JfNPgV/kVEERzee6xZYTVebutRaXiQ1HyFttyw2fxpgHYLxk4cSyb+PxzuwxlTR8Svt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=D+lmqK/W; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="D+lmqK/W"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5333a59e20cso10617781cf.0
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790607141; x=1791211941; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0iK2V+cwCYdpmdm6x/CD7QqyYK9DucF2a2Yc6LfV+Q=;
        b=D+lmqK/WWgaz3p7Tg3HWuZnXAJGQXF4mNLWmi9barUUf6e/72+feGhEXRJY8Zf+UMX
         ANJaO0sNtLqbQvE2BoBS6FbarxJqBecQfwO01SDXAzfyGD0xlWDfRD/WwJIjaZzqxnf/
         c4/HnU2CQwUNwo2h+UZgAUt6QpzauMKJGrHhiAkNP6y8gNgF0/0P4xxgZ7un9Jqp5Wu7
         1D909HAyokoIqXyGQpT5xg8UdzZlp9kApE54TKhvt6cTZi9gxjgFQN9VVS7uP4FOhPXu
         EgVJ5AWLvAsrGHT0xaiyXNcu2nj5WorsiJPE3xHH0B7ZIWCn7OehyQHA/MV33tv0Eff+
         cSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607141; x=1791211941;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0iK2V+cwCYdpmdm6x/CD7QqyYK9DucF2a2Yc6LfV+Q=;
        b=aFAy4WYeAzT+3guanIuD9wNLmjR0Bu/noni93oDro55JPdnCBGbzqV7WIgE93hMgi2
         JOKgrbyQ3rv42gUWtLTj9BQKRzmmcPMLfFTMHpR51YFozvv1wgxz3HLc0tFhqMx8edrp
         joVliz5SX/fUssSZfWVrxQ+qdYch2dBMBlTxnos+m58RmnhWMydDzTLPKJjm/AQYvRZZ
         IZfzrP5kV/YAFNrN5i0No5sllZ1qzvHABL40fusVvVv0nLZaqnk+sB9Q8ZiCTkpVBrgH
         wd4yvOqu9l1Jm+sXW/Gim9TjXoDx1S72wNx22gkEJ+P4Ua1o5RySt8GNV9FZXFO6Xvsl
         htfg==
X-Forwarded-Encrypted: i=1; AKwUvBwE5EhL19Qh06xUS1oJZbNiRCPp54ko9/YGdTofYVgiRMlDVAlONfdkS0ErSnaxgqsHywc=@lists.linux.dev
X-Gm-Message-State: AFuF++nbm91BHe31lC/tedKPMB2fmPbQ5vofJZpDLWSLEnSmJx/266+5
	ts8dgpMzTZt5kM6G6D8x/CY9pab3o3SdpKz+O/fUgZAoAg1bIORh2mby33csJkoM0so=
X-Gm-Gg: AYBFou0PkepXxq233dAyWwVzlXT1GDpjc0dSUeON0bYvCp1dNAGo9xdIV619qFNYTJV
	nheC+75jchN0rHPV/YmUxV5njrx5s+GbaJncNFcsdo2sK5PKI5ZOIVasSL2eU3sVITiQyqC3PRj
	SC0fiFsGO5GtwGZg3m2bEwsprDO/oUAb9mv+nSj0LuJUb24XTX7pMcTwnK7TMBo/izIFqupMKLw
	GBHdfsM86CI9YN5XH3dT8mnpbfeBUm4CG5SsJQb7HrDYE7J9ryUH+UMb5EIV6Lez6bJu/rdo5Hb
	JP1idMT0iPqIbnkpsbUzeRby7uu+VoMqlzcmJE86ouq9mBiCSCMBTxbyI1D50MtpXDZ9KY/nv7D
	2hyR2Ko/hkrg826umq5EAwqm9/JPKpUTSYsO9snLMqAwfzF+KFcLy/DE4YbOlupqvjgKHXOHrPt
	BRwaRhB2FX80ct6LGIeqZbo7E4NpOGEEILECkYJbUKh+7h01IZBFlqIW+S/ffhOV+ZUvUlu7C6a
	uCpL3lSKRCeLA==
X-Received: by 2002:a05:622a:13c8:b0:530:e52a:8ef1 with SMTP id d75a77b69052e-5330b5dff3dmr218288981cf.26.1790607141221;
        Mon, 28 Sep 2026 07:52:21 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.119.56])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322388d06sm64157141cf.16.2026.09.28.07.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:52:20 -0700 (PDT)
Message-ID: <4bb9c85e-f991-484e-861f-1940b8263890@riscstar.com>
Date: Mon, 28 Sep 2026 09:52:18 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
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
 <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
 <fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.org>
Content-Language: en-US
In-Reply-To: <fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 2:25 AM, Krzysztof Kozlowski wrote:
> I think nothing behind PCI EP should be described in DT, because
> everything is internal to the device and implied by compatible (or
> vid/pid). We do describe internals of devices in DT usually for complex
> devices (like some display blocks with multiple subblocks) or when they
> are used outside of that device. That's why I asked how are all these
> clocks and resets exposed to the host. If the syscon is used only by the
> device itself, I don't quite get the benefits of describing it in DT.

You say you think "nothing behind PCI EP should be described in DT".
However the mere existence of the PCI endpoint bus as an option
contradicts that statement, by providing a means of doing *exactly*
that:  using devicetree to describe things behind a PCI endpoint.
This is the model we are using.

In June we switched over to using the pci-ep-bus model based on a
suggestion from Rob Herring (and Mani Sadhasivam).  Rob felt our
previous auxiliary device approach wasn't right for the peripherals
found within the SoC, given we were accessing them via PCI BARs.
   https://lore.kernel.org/lkml/20260605144032.GA3659201-robh@kernel.org/

We found that using pci-ep-bus provided a very natural and familiar
way of representing the organization of the TC9564 SoC, and used
it to represent all of the peripherals (including XGMAC).  It
nicely partitions the hardware design, as well as providing a
well-understood connection with the software.

The switch involved quite a bit of work, and the result is a set
of basically independent platform drivers that are modular and
easily reviewed.  I really would rather not go back to to what
we had before.

Do you have criteria for what in a chip/SoC is sufficiently
"complex" to warrant allowing devicetree to describe some of
its internal details?

I believe the TC9564 *is* such a "complex" SoC.  And in any case,
anywhere pci-ep-bus is used, it implies that some chip internals
would be described using devicetree.

Would incorporating the chip internals in a devicetree *overlay*
have any effect on your opinion on this?  I.e., the "main"
devicetree nodes would simply define the PCI device hierarchy,
but anything behind an endpoint would be described in an overlay.
This way, pci-ep-bus on a PCI endpoint just provides an external
interface onto which a very complex device could be "mounted"
(and described in an overlay).

I'd like to continue to move ahead with upstreaming support for
this SoC, but to me it seems you have basic doubts about
pci-ep-bus and I'd like to get past that.

Thanks.

					-Alex
