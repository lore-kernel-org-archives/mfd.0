Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640428;
	b=bKyfLsgCCQS3mJ/Bb8HbEN3Y9eXYtIVOw7b0ukFCaGhi0Dsvr6ohE3YVFsXH8WH6snCj
	 ImFiKmngEbDGi4OxfDJqf/Ru/eGbSiHw90SK6as2IR/CFLHUAVTaKdX5S8cICL09t0sov
	 borP+r/XoW8uXIK8pRXhjqRBkro05tFi7psDmHh4mLTC5DaawWz4zWQxkSnrGbF6t4pNg
	 WKz8u/Tx92+EXFTKlWrfpwdcQ3ibOMqisMJj4w4l4Yg0ONRaG1wYXu8Odj6CUv0nArM/6
	 zuxLZQMocdIrYiS+HL10nBWfxBAE/Zs7Yde30pFX1KzS03/bk58lD1K6bLAZ5K9fHJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
	b=Aiwe8efWKH2Cp5KDfAqhKxVtPFpbRN1JlVJX9KqYoPbSUZO3zaGKX+yt0HBsHNoeuRtI
	 Tix0GPGw5RFvrfLp0uaghyysH9Kv8EvUCoR2l4K7Uq8kMe5H5IlPfUj+504xQfQcEeSgB
	 AufF88f15nm8Zh19+AmrGATwH7yJf49eBmxLe0ctstx+e1urmgjpZziTX0TrKcI2nUXu1
	 4ly6e+KgkILVqwx6baEZIrLR2IpjRWdhpjWxoZcinPUdgJKDtnx/cjVmBMiHV6AOIhDpG
	 jxA9IPM3bHVorlbP0Eay0gWUWcumDEeeQW2nqlcBMUduKC5uhfsToBi0iU2WQ8OMyyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zL8d+E8K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A465606A329
	for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 21:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A465606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zL8d+E8K
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so7409672a12.3
        for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 13:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640426; cv=none;
        d=google.com; s=arc-20260327;
        b=a5bMMsf3GpwqKT/JYrnB0nA2z/TUuZrsnqFjc7LKBJAW+2xs0NBuUDr1J2BQ9jJNrd
         Dx4uaN/Wf1HgpLMUgPVE2nsVPmAakmCvEPMvNoZ+ObxcjX7kgNzP7n1Qji1citJvVciS
         0swtwWlDYi2EdEfYjVlIEM9okxQ8e8XcExHRpmigXoR221uz598ll5VeBIn3i2NNgslM
         0QphJeELro04XmC3f4uXp4c3xY+pHzIR1qZXhGNe6iahAkfQlTXNSVd9mUocMcZyzTCj
         szzEuWVJyD/Shhu1ldXP3J0yfI2h4vGkh3wN0NL31dZy987pDLzdJtKiblJWzipbK2RW
         in1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
        fh=h+wqneFNn7glIbxdOgH1DqW/KIqK1thJiNSBHkBFLDU=;
        b=aLyU06l8yuk3V4TT6r3QhHKM185hCYBhrvcHW5/X2iJW7CJsenBaOg33PnwXB9ruur
         9aipr2fMc6IcJ5YIUC4aHlzzhbq/WNVUWZwisFfH7YmodWysMj+fIJsByhfkAvG4pOpp
         q7cxsPPwQXHc6Ylx8p880axlo/+pxM1TVuxScjmg53cQWr5IZHX3euxNV1pz/U5AmVun
         dDWR1hUoFzwz/wJC0DaYF+Bl+DITODwkdRTF1ccq/Sf50x8JiBlResSrsBUbmSc7i426
         JhLbzmue9qsAYkPXqF1gYSM/f14OAWNeWbWW7PMTITHCf3n2fGIBn9A0TOKaEY6bxDGh
         IB8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640426; x=1796245226; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
        b=zL8d+E8KFxra1dQrT8SGqiYnR2GVh8YNVE2pQENf1PqrYTb5+DzQUsJogplVMavPxF
         YuHJjymSrK+usCuQ336WzLe8r43ROnD2iexOBmKO8h2AKhWWuQ9B47RvNMadhTJPehQf
         tnErjE1JeLe/IaRJuvoxgPG2IceS8npFdiO0GjI4/RQOMMf9VRSP0x3W2ZiXB9SAX/Nt
         9dcO1wKWz0eFy+PgaRzsxLVRZS+Y222FRTR0hhag6j/mEXfQKjcNgnPdjEV9kC3fEzxv
         z4t/UhG1/OC8oTzy5QHzIM6vbLmg9eh2s4DOKnwfDoETsbL9+yQMDtvp2Q/FLADCaRCz
         8I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640426; x=1796245226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
        b=L6+mlJShPgsalEAZBCsgDHm6EMCOOe3OIBBp6iOiWxnkUw1uNWFvgf6igO16UD7z9u
         Ysdo5ZFbJPGQl249fV816SjVrkSs6ReGGtgv0uqgHrJL40I4fH1ofHWVEOFBzC0kszmh
         5KKDrcWPPxDkRYoGKl64KSu/Z7IIG9/ihUW0lkFctzP1AXfzctSRcg4dji7coUgrtebg
         nYbhBth76FijuNGNHAhs0tmWvKYVlHORmSpkegDGiYxW0IbSYulv6E1TBH4WDGjy9zX+
         gb0neZBRrKdy6v2qoZtFGWCOvMyEkWKGW1mGQw8+Rda/t29XW05RRzSBQfauDh0oK8/y
         oyQg==
X-Forwarded-Encrypted: i=1; AL+hErFwjmXSVkeSXPloPQR3MTJnbrvstvCojv89MfK/uYx42oxWtjeNcOWHzD8d61hJaru3y9o=@lists.linux.dev
X-Gm-Message-State: APuU4Z/3To6NyE+TtCQYbatZgFkamM9Vj9bSi6gFDMDF+lLDbSAnrP6Y
	AjUhiBDV5/V2zL1t8rl2Q8E347YpIFWbZUOaMSHX3itP9ln0Q40aDErtXVsxfPSR2AHtzxRvDBj
	UDRw0qMwM34ptuQiQDfFMw776kZKj9kj4klMgG7owzg==
X-Gm-Gg: AZFdTZc7FCvMmztmECeigRQpckayTjvAl+jxxA/qOqx48L7nAl2mUtH0hGOfjIPk+BI
	EpI/sXyAhzDDxsH9j3w/yayCPHnfbvbJH34q8fm+CP6I7WnyT/Lhm44E6ZibQ1mfZxcEOS135Dr
	35YbfjRIKwdG13MpBZHLgJxq/+JzVsJ+SzHthvbqF1vNC64K2uuEEF5HuvgoaLbzpxQ5cj/x4+4
	UttkQkRYYGrrWDMdwjZzHPjBHKTRQxK6DA0NQpCl8JVcb52vfaiijzUv1lYO0XGtlY3mlXrdN4q
	t4CZSwHSSvDl542Zrf+YpjbUGUV9cZIBti/NsopaZr3lCtHh7vEiMmDUa1f+V+mgt5H7jsHWyAC
	Na1wSO74H5/mLj4kgJ+c9hr90oqJn6VFCUdSpjNj7tZKlsBgE6LLM7GMB2dHG7E3j5JPL6gh+0Y
	E0znNrzjAFQrhw+Gp6
X-Received: by 2002:a05:6402:4501:b0:6ba:3740:2d54 with SMTP id
 4fb4d7f45d1cf-6ba37ed4c20mr13845602a12.45.1795640425718; Wed, 25 Nov 2026
 13:00:25 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
In-Reply-To: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:00:14 +0000
X-Gm-Features: Aa3M54pc0dI-wBDqtT1Mj6foyP5ocu6bTueh_HXlntbnLU0FpkGjPiw7MqGkwVU
Message-ID: <CADrjBPqpioic=KH4=Vkd2S6jSgqUs+6kNg6vsmOwtZfPPvR3PQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: max77759: Set zero DMA mask
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Nov 2026 at 06:12, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> During probe of the DT-backed MFD child devices,
> platform_dma_configure() calls of_dma_configure() with force_dma=3Dtrue.
> Since the parent I2C client device leaves dma_mask as NULL, both
> DT-backed children trigger warnings in the kernel log:
>
>     platform max77759-gpio.0.auto: DMA mask not set
>     platform max77759-nvmem.2.auto: DMA mask not set
>
> MAX77759 and its child devices only communicate via I2C/regmap and do
> not perform DMA themselves (any I2C DMA uses the host controller
> device). Clear coherent_dma_mask and point dma_mask at it before
> registering the MFD children, so mfd_add_device() propagates a non-NULL
> zero DMA mask to all sub-devices.
>
> Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes in v2:
> - capitalize commit subject
> - Link to v1: https://lore.kernel.org/r/20261123-max77759-dma-mask-v1-1-6=
f5c8d52904f@linaro.org
> ---
>  drivers/mfd/max77759.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> index 5818ee2811d1..e31af2c0d25a 100644
> --- a/drivers/mfd/max77759.c
> +++ b/drivers/mfd/max77759.c
> @@ -693,6 +693,9 @@ static int max77759_probe(struct i2c_client *client)
>                                      "failed to add IRQ chip '%s'\n",
>                                      max77759_pmic_irq_chip.name);
>
> +       client->dev.coherent_dma_mask =3D 0;
> +       client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> +
>         ret =3D max77759_add_chained_maxq(client, max77759, irq_chip_data=
_pmic);
>         if (ret)
>                 return ret;
>
> ---
> base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
> change-id: 20261123-max77759-dma-mask-65417b861a53
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
