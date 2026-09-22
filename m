Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52952FE27
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072008; cv=none; b=mOAn6ndi9P93WbFyvrj+bfx/y8yROUT7krf3DE7YsQkhMC1EoceoIzKtPPfSlJ19OtnXqbdcaD2whPk3Fz80aifHS+b0+bwAtqclyHFA7lfc6g+NmTTDU1njRqzFI+N0e5mp5UQdF05riZyQ7fT9DcjGyLAon6E/mVZ7+QaUnDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072008; c=relaxed/simple;
	bh=wB2i318i/HbPC0HKTfztwgU8Sf6arl+YZ4ZdMovJCxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keRT8KVS85RNXNCEFXrYeNY/kNqNbgA1EGtSzvWKBWJTlp5P5zRXGSsiS7OdcyhobPv4n4wseCyPMLB0F/dnI8CcBdVOclxU+zn5WMi9IQ4uicqrKzi1vZi9WyOxTzgbsv5EutAUp0GtfeG1R3DnYMaI1NUDtzFJhjpon2GQvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7SCOKDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9TQML9M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7SCOKDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9TQML9M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dEhD3675242
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 10:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0el7bjuErDhLYtuG9rneG619xk/rheRzGy3iRFFfwQ=; b=i7SCOKDXt2eU2cH0
	ansFF+NzxfioO9peEW4+f3IBOhJGRHojBi1dIa0LAZuhycDXOn4BF+43jaNsP0YD
	P7YtlMEjF1mGHD2XBTu5fzovZIw2Ky4K6Suz0EuvQ//UvvqnTbjzgaBUf/evLjcT
	MkhMEr3Wkj81dNdUS9Z2vGe6jfzjU9QuHSc1WDX1HvgMJAXzR3nksV4g/fm3xBuw
	3nokLj18kjCqThxbIS9ccbS0jGb1qGWghOpG9ZQyiNZZXKQEK24zIaG/+qIgUZvI
	08HhJvSTZPH96MfcSktZ8Mf4MNkUPFZv8aVQtA+ZnRIADCSMw1DuvAm26lslUOCZ
	scpHYA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5smwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 10:13:24 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cbaa9bef2so46751241.0
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072004; x=1790676804; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0el7bjuErDhLYtuG9rneG619xk/rheRzGy3iRFFfwQ=;
        b=i9TQML9MTDjrhqiUNuUS7VBsvjTaUpKJce45/K+Lm5LhzrTonPgWmi0rn2g29A1Jxv
         1nTaWdiqLzuR02DAo8CrVtIPuYpr2/anylPTi3HvS1SciyZ1LYcz79TkELtgYf8e3NXB
         qVEQDTY/5TWQGEtEM2VpN3pCTfYQmj+nYhvRD6pmk0DlhDBYemZxbQ58y10HIF2fOIkA
         VlfwzVvhju6v/85szPB1CQAp4lyudw2M/T4glDp8sOs0DVF11S+Mi62CKFwV9zuhzPrC
         +qKGUwsQTElokyS4SwTY602bgal86M2QSIcbge2JUCbI9AnTZEQp1N7eOCVDPIHePAi6
         C5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072004; x=1790676804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0el7bjuErDhLYtuG9rneG619xk/rheRzGy3iRFFfwQ=;
        b=TagOS9qHfnlhjYC8UFFuXQjtgyS7EE66qFHVfEQPamJgqKKi45LQpIAXRlyTVke5Ef
         QAcrojhEACSDAlZiMOiO3wkalw5SIcIEYkSpWz7nOM1X2aNciNBQl83uBcSqvW2epjiC
         yCS54Y/Dbg0/+VvLyDJBAEOv7Aw0TDRS5FNf0HdCQaFPXGQ6SDm0C9eA5C27QXjFvDWs
         abA8dEIgxAva1yqGQk+miOOh5UKULE8F8ngASegD5vsJ/IEbFeFtYG3tt/1HJ2d9E2mV
         Acil+pHene/4XbVM38SPMa1BO4budCxl2Y9frhN8WaHF/aWkaPsgbuyl7P/kQjTwP434
         e5uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFyb9LAerCP91WErGTeHLvFeCz+uvR0QqFKoMqm7CEQUjmAXDIoNtGZkBRAHJfCGRHNSE=@lists.linux.dev
X-Gm-Message-State: AFuF++nkTW93R5IwfhHjmJj1BQARzSEVu86HIhPQOWwgJAtOXAjOARmQ
	PIAGYzbNR4MEm3zz6zFXzq6TM89Ytm3y2jFXY/qrGyVlrn/iljirk84qwrdddSyNnsmLuRfkRib
	ahSmN2Yh2k1hkjjuFB5oct4k+zk2p2ONLIxITppd3TmICCGCvLa6YPEM=
X-Gm-Gg: AYBFou0D6ACdwQTidDDEwY9ymOr2DZ9aeP3lMTBZlF4PHy5ik94hukXV26ArDh5G8jH
	1s4Qxren4oU6I0IJz9Rginwv1es3uDEp49UTFAIoFWw9uTOXH74BdOPYh4qWj3u6TpdqTWeJEaB
	u+MHmOhn0KgtzvRjDQHsm66r7G0uypXZOJeuV/PpUnRXlRRD+GAUyNSL7kiZEmTFAg7IDK27m/y
	PfyXe2t04r7foYA4jLD8dmwtkhRnGCVFq5Y7n6jBZm/ty/114JB6pWX4JjDEoW4PgqqrI0NSaD3
	FJnaX27NTqwepa92QPowkktlixPtJvNZdIBYmy8WjWMPJ69AUkq2UmFqfI8z0gnOji8/MdTIGmT
	tvs0sU9uBXOLs6HFO55HjGA==
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr4973406137.0.1790072004194;
        Tue, 22 Sep 2026 03:13:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr4973396137.0.1790072003762;
        Tue, 22 Sep 2026 03:13:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e7850sm60804766b.42.2026.09.22.03.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:13:23 -0700 (PDT)
Message-ID: <58efd258-dc43-4d5c-89c6-81d1f9b528ce@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:13:19 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
To: Lee Jones <lee@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>
 <20260922093327.GA2308615@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922093327.GA2308615@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ghXNQMrZxRe4XFPPXuHML36xgVgwu0Ay
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfXzjuXS3HalfVl
 cFln4/Gxc/HkPKm0/c8hDvg7MMD76JoVBeQ9T99tFY4GeHogW0WywO8UHeb6e7Gt3SgWjtOAKcm
 NdGQbMI+cNTykyVeumVLLSCbYOIzH6Q=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab254c4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IqmdDbymtu-JnQ37yGIA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: ghXNQMrZxRe4XFPPXuHML36xgVgwu0Ay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX0V46cxNSmsbj
 VU6++9fj+enLlYhjGdtpt5BhG5u7fvJPZiMBfdpTYqgWdTMx8CsMpDvnFIcCQ9gwI2FwZIMgfCC
 iiSIRTQ58c5CvHWr0ninmSPtt5sBHJwo7lB6sWenBVMxUMv0Cg5Z/aI5QbHbKuQdg9jX+DpDjuX
 bt5XACZSFxj58W6JMHNYSF3OGWTam8mTxSZB8Z9dGANCQKWSeTf8NKM/7yvj4Tyg4/XnUKVC++i
 PIYLqpExKnBEIz8xWYoSNQ6sfsPaIS1pPx6/uw35/WnlltzxkDYBuvU6JYovSUt7sVFW5rRFaFh
 RDjvgIQBGJahxhwe8bBgZ+MbDs6EUMmE9E8G7xPyMeiwNO+Ulphqh1vlNHA0gEW1wsPr2WjF075
 3/3pvF4mXdQ0b88lgN39+lCqNEmqBRF7yJz2S+1+U0skpebgUxZxmKdso91ZvA1GCW6uToZFhy0
 6+FZaz7V2U5cgHcPHuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

On 9/22/26 11:33 AM, Lee Jones wrote:
> On Mon, 07 Sep 2026, Nihal Kumar Gupta wrote:
> 
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> The PM8010 is a variant of the PM8008 PMIC with a slightly different
>> IRQ layout and MFD cells. Introduce per-variant match data (IRQ chip
>> descriptor and MFD cells) selected via the new "qcom,pm8010-i2c"
>> compatible string, and support probing without an interrupt line by
>> falling back to a reduced set of MFD cells when the client has no IRQ
>> assigned.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Who are all of these people?
> 
> Did they all work on this?  If so, where are their Co-developed-bys?

I wrote an early/incomplete version of this patchset and handed it
off.

If that was used as base, please fix up the attribution, if not -
drop me from the list.

Konrad
