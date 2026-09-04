Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9248D38AC65
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488088; cv=pass; b=vDe8q4ALAykcNvx+8EGrrN5ZeWBMtkT5MBiFd3ph8/g/SLxDgAOFKV9xgAOa/ABgtT8pxfC0EUCTrgbWt9cPj8ZHs7iYGl/K69AxhXM0NtWD1m+h9KmqKquicRpIsHTf5nxFfcb4MJjQOOQgm1cxVt2fc8xZ6qLDaU+GUbR4kuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488088; c=relaxed/simple;
	bh=Pzqdbi3RRHpe0N553BflvowJSQBmzpYfCdEfpxpl/D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSltgFtEXY1IzfmgXYw4GHfp5/wsOEIvjfvIaiZBYJKQtACQNxeUJNbu/VRhA/xswlKjeL0TZMiiG7rT5vtjOcDL54zES2vWnbwdS9U8DeFm5QKxTVxJbarWISrwOFnwlX9q2ThzL46i27l25+fmZmphvVEap7AxxWAaxjrSVO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhx3npC1; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhx3npC1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c25ee9d1264so54234466b.3
        for <mfd@lists.linux.dev>; Thu, 03 Sep 2026 19:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788488085; cv=none;
        d=google.com; s=arc-20260327;
        b=LU/dSDbbdwud0vZ//0UHZ7uP3s86e/Fn+iUBHsobHlMtqfa65X7ucK6cgAWvPl5DLj
         3TWnHQoQ55vhFNHeQ05uTk1kBP+ELTYCf+yWdF7dmVLGVDUvIVlsunCaNIw27Df63ONN
         vgXQ2+xiQPDGgfzFKu4b/ldbzK/6qxtYP+xHFH/kI9ZhAEb8sp24CTu7ZUI5HAhHGNs1
         DTbDRAfz0+veoDY3g8iDHaFeYKOP/8MlshIH3aOJLqMx6iOrZxbWR6Cw2ST1b4kso/Sl
         LEqsRre2EyQlTnyvmCan59BmgTFwFjxdj8TWTfZRHxUfGL3/a/d1KbpvAiRvVykwANe0
         R9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uqa1DV0xpH1IjJX1eyvqKAnrnqlF+OorXYNgzbrOl8=;
        fh=VWt4bW17iLM/oIEARPHr5lW3eXW53jXTrsCaYGRNrq8=;
        b=s46z7394zilYIQL2Zym/VICVefIKSOL+VWtx/Ec8Ynyex8hj6Ox8W1M51zqIU2+Ay3
         kGSigdTaF7b2PRLGymTJQxKS4LGAPv9tTJanNuDw/Ltfvid5y/aOSoFUD6nXlNL/qIQo
         jWmlo6GU4USu1ICiINsAPVX1ByHFOj7+1DkfOcI7JrJaD9Oe3E6i8ShWmcCNIyBuQ3Vp
         Au8W2uMYguqCdg6GZ0C5sn9y6f5iGbIHXZ0vhee9q3rSUC1V30bNEKiQTA0kz7LXbMNT
         EFLiinYNzX9IU9CYdSWTeWrEXoCfscQz9eq1bulpisFMAykbgro3k8qJmT0R9RtXQkA+
         iIlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488085; x=1789092885; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uqa1DV0xpH1IjJX1eyvqKAnrnqlF+OorXYNgzbrOl8=;
        b=jhx3npC1AWSLS0lKohys+rchboR/FoGwG8hSt//oax+42+vVrc/AeBYmjOGwT/zacA
         /88WWFDNUfxOWWN19nEo3MI5WuCteHHjUg06Te9etghbDM2AlWuLe60ic1QKiW6rzAdG
         UHDrV2furEniBjiJ7atqdjku4OGP4rnbIkmuCW9AGf2r1g45hLRpG2F5F0Lba+8nvkKV
         1hUdvLjzss9RTM1DCFXhWl/kYPDub+wQl2awDfUanZzYM0SWupcqnWKxnkoOYA/GcLfV
         Rkyk4TpqitTJGkcKOIReLoI2ZbKms+TFQW8jqpswjBq3FdQqpQMx0Ei2nGJAtgHMzf5X
         9LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488085; x=1789092885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uqa1DV0xpH1IjJX1eyvqKAnrnqlF+OorXYNgzbrOl8=;
        b=Oe+o2A6aiSkhgloKkrKBakMSWC09mja1qLU9EmthpX9tA1UK3lO218ggJZQ75cMaUV
         iLDxUB4ToPpz9U+yLHPzVE/thVbwbartB/ZpM5TO6Hn4MsNUHqT4ZPOQpvYSkApxHCvK
         +Otk9Rutoz4LEZH9p+P3k557Uxp2vSF+p/3XJwdr9fNWSdSGZEFUQfRwerR2qdVySTBA
         FbOHrPGobtpx4RKeygkbxx2SzfrHpCy7ySKhRWCooRxKcFrCxHbLGvPMg40ahzvXRV8Y
         xG0Yvgz1eMxnYXx7OU1B1N1U++gsm/NWuTrMQdMNskBmRiuVdHIxJH+pR+z8G3yHqO3Q
         g8ew==
X-Forwarded-Encrypted: i=1; AKwUvBzRWocdg1XbiMVjnw4yCnVXsmZGtqULwl04peTWuwJRHhvrMKUPnHNV7gW+X9aJZvUo9JM=@lists.linux.dev
X-Gm-Message-State: AFuF++mOU3KLsnXraZxzoXF7vJ572GzIBvk7I7xkkKDrPUza003Ux5Tg
	+JTw3qRe98xK9VLeLpl/cZDcH8h17hHMAEyfF8FbP/YhejpwK3g27vdtUWoqOsqiYtpUrhm784L
	SF+vAm3odoKcNGcsK6VuQlc14TmaMYbQ=
X-Gm-Gg: AYBFou2le4QhbaX5D9v06zu3mL186+WEnYhF3UqCTKoVPYUQTfKe0wNaMPPNLANwOIA
	nj4QxMAuzqfhx2IPH4+7gs8TXVTs5vz/P5fj5tdhLXy9sRfDlKWtIatpNTk8NDuI6EU7zZSTl1j
	kAxEhVchMt/lw4G+pz3UJtuLag1lXChSW5lGiU3kSpmjr0uVehyRdwlbkYPeYM8kF5OR7bYiUVI
	9AS84eBPRrXu/b7BZjfsXlD6xLrd9Li4e6ew5krDso8TokY2ilfcxSm0wOiM1XKVZkxYA2FtDRD
	6ElwA+qT/Q+dQBxClYDnoUe1OJrKEOLIGA1fNkLYo7SOIA==
X-Received: by 2002:a17:907:7b88:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c260c8dbb76mr156120766b.7.1788488084563; Thu, 03 Sep 2026
 19:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1785829933.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 4 Sep 2026 10:14:31 +0800
X-Gm-Features: AcwNN1UTRYLjNgbLbTslfZ_vzrwWXhv-Ow5jOs1gk9GCuNsbLMOBe9sFATKRyzQ
Message-ID: <CAMpQs4KWvDg6nnpNS4t0jCkrHVc7RniLkr61BznxdNzZy=EmFw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] thermal: loongson2: Add support for
 Loongson-2K0300 SoC
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Tue, Aug 4, 2026 at 8:41=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This patch series adds thermal zone support for the Loongson-2K0300 SoC.
>
> The Loongson-2K0300's thermal sensor is generally compatible with the
> existing Loongson-2K series, but it features several key differences:
> 1. It has an independent CPU ID register for reading chip version
> information.
> 2. The raw temperature output field has been extended from 8 bits to 11
> bits.
> 3. The temperature calculation formula has been updated to incorporate a
> correction factor based on the version information.
>
> To ensure robustness on older hardware revisions, a fallback mechanism
> is included: if the calculated temperature falls outside the valid range
> (-55 TO 125),  the driver falls back to a simpler calculation and prints
> a warning.
>
> The patches have been validated on the Loongson-2K0300 development board.
>
> Thanks.
> Binbin
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> V4:
>  - Rebase on linux-mfd/for-mfd-next;
> Patch (3/5):
>  - Remove the `compatible` adding to the `select` node.
>
> Link to V3:
> https://lore.kernel.org/all/cover.1785480242.git.zhoubinbin@loongson.cn/


Gentle ping.
Any comments about this patchset ?
>
> V3:
> Patch (2/5):
>  - New patch for moving thermal_ops to chip_data;
> Patch (3/5):
>  - Correct spelling errors;
> Patch (4/5):
>  - Add Acked-by from Conor, thanks;
> Patch (5/5):
>  - Keep loongson2_thermal_data->chip_data as const, and use
>    data->flags as the private data.
>  - Renmae LOONGSON2_THSENS_OUT_10B_MASK ->
>    LOONGSON2_THSENS_OUT_11B_MASK;
>
> Link to V2:
> https://lore.kernel.org/all/cover.1784619512.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch (1/4):
>  - New patch form Sashiko;
> Patch (2/4):
>  - New patch for adding chipid syscon compatible;
> Patch (3/4):
>  - Use `loongson,chipid` phandle replace reg property;
> Patch (3/4):
>  - Refact `calib_offset` calculate routing;
>  - Add LS2K0300_OLD_FUSE_FLAG flag.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1783670011.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (5):
>   thermal/drivers/loongson2: Correct thermal sensor registration loop
>   thermal/drivers/loongson2: Move thermal_ops to chip_data for SoC
>     scalability
>   dt-bindings: mfd: syscon: Allow syscon compatible for Loongson-2K0300
>     chip id
>   dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for
>     Loongson-2K0300
>   thermal/drivers/loongson2: Add support for Loongson-2K0300
>
>  .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>  .../thermal/loongson,ls2k-thermal.yaml        |  73 +++++++++---
>  drivers/thermal/loongson2_thermal.c           | 110 ++++++++++++++++--
>  3 files changed, 156 insertions(+), 28 deletions(-)
>
>
> base-commit: b1eb3de64d02cec71b419b9918d1697797fa156d
> --
> 2.52.0
>

--=20
Thanks.
Binbin
