Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014EB439328
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429975; cv=none; b=VcoTGkhncfOkq6ePyKSBKBx5A3Cjwc9aTBnqIBck85KbaHCFlAzhILNkJoYpy4tnFy8DVVDqOQ1rk3EClzD8b6TCiHRA4OOMB2XVBC/kfYaHsk2RJxtBK3IESFPbfpG3j7E4OpUdvUhoJd92HiDofdYu0rtx1zwkkFN1bDGVHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429975; c=relaxed/simple;
	bh=4PCF/pTuaQyrbWnAxj22N/OYcuTbKlF5oGBXIAB9HlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qry6uLKzrnlEqTCqZFAnugD/QF4uSDs7ue43NYV/5k8XoXfU2KQRpYKosZiv9lFtNNnxzhD2618K9l6qjWubDZPFRBmOyfr/BPDZPxPrdBgID6UVIDQ3oa0ycS8Ayg9biDwEYLVFqy/MRJ+zGpuKQLy7e2E+SiIy0Ybv9nClMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYQuu1dU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYQuu1dU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso3933485e9.2
        for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429972; x=1791034772; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=aYQuu1dUgU0/L48YF8ILb+JuU9SwYzDgTGozBCV49UudZDhN9XMRQtJbI24YoxtXPE
         qpqwziMtt7KSjxewgPGLg+auBBkzJhh+66uvfmhSgRtbnr27uA146ae9SYIM/+pOBGew
         ruZfhguPHFsYpmE3bYubTCDn1QcEObegumcvpT9A59PqMyyUALsNPMtqvdmlzkBuV4S6
         jXXEvjc4oP3gEdT6H4u4lBM0G5YXFdq7Kf573MdeM9u9KF76Gdmyaw6ppr0ItZb7f+Vn
         br1ZiX2mLHS6P4QMSx+b1+2penbMMZc2Onasok1MKITtK+OX5yhavnWtti2zhdY5JmVs
         jybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429972; x=1791034772;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=WDdN582Lx16MJzuP9E/VmvhWQN8REswMg///pr6FZgzXo21ElrAjlwFhlWl4VM91q8
         5OfOvJCdPjJjyfeeP9GKMMSVhUtmNwOOG826X47fG8WHEyL7y6FvJnr+RbRgu3aT2crV
         bk6OHKbxpavMK+6Z67fKrTM3CTwEMp3RsOXnphl1NjJTpqeKpWqKYjrU690fzB4YcDbv
         NdhU3TL2SnzQL4QUjaSMC99CFHJwuPdAPxDriEgiEir791uO7HBwzIvJMhpz6Aq2Xd5e
         Dd54dtLfndOG1OKZhqB10hDixYqvemG2O7UJXg/pfWw+TBS6GSoJxIQD+61qkT0Ni8Ib
         u1Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwsIJy/+Y5EJKVZ6YN0o7gmYtC1w/hL0FX9PclkXxAq5cLKqvxVrOo5BuOKVxw8aI8NNwU=@lists.linux.dev
X-Gm-Message-State: AFuF++lgHbDB1ghwfhRq+gauL0lQ/ejRpKOChUoB0x71h6XOAtmjxGeM
	SaF42aTi2xbVwJFjKMTgmjmQdsGy4BQZCUJzOY5hhOh6uKbcIzweYNBWjPSlxhIYctY=
X-Gm-Gg: AYBFou2cD3B0AX9mFnZZ8VsGDBKFHvMo27tjr8Kew/9MGlEA6HY1a4yjBT4xXLQSijn
	HNBqavzzIV3+cGjUN02vqOBuTX3doobKy8wFT81Bcri9zTcNbGw+8q18EqaUsf74v9WVKOZpuTn
	zSTXepVI2RTLRGTOl0zsFhmEXS1JeDEYB/WzQf8MevUfIVtEDsEG3DCwbHY6HOH4ZchArkaxDgv
	Zd/rn5tSvFT9DCRW8ByILKukFyt27ievwyfVyOfknOYxJxGq8rzfMX4vPMgh74Hsg7BZAIDU+RR
	Z5bS9OPkMhasclPcaexHEEjaapdW9dvWPiEUJjBuun9JfDYs2OLs0m+S3QBRw1+zhHyipKEvgx+
	POwKWkexxqhxZWeivyPgJFnsjyaYS8knsM9gwP4x6MKpfgfSaNnXynxCAtYa8rBC6f/S6GsCERR
	Ix7/1i/AWjbTbF7+OdyrKJQdBiPTUo9AnS80a3ySMXAp7pkp9tdcWgLIaIRj5OTGa1rahVZTIfW
	qzNZg2j5zw=
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr113280505e9.4.1790429972111;
        Sat, 26 Sep 2026 06:39:32 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm14706746f8f.7.2026.09.26.06.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:39:31 -0700 (PDT)
Message-ID: <0946da1a-e8e5-4ccf-a422-abcbc24cdab3@linaro.org>
Date: Sat, 26 Sep 2026 14:39:24 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/12] usb: typec: qcom: Make PMIC port probe
 selectable
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is a preparation for extending the support with 1st generation
> Type-C.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
The code looks fine but, I think the commit log could do with a bit more 
flesh on the bones. "We want our own probe function because"

Then:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
