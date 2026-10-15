Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE04E323F
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055642; cv=none; b=BPqIQW6gocdcZgA45hd/eqNQjKr6Xwr7OIXzvbbWsmvfV8sq0CunOJfScFZB9BgAWmPZDufrv8hPCAWuyXZTnvZg+6/6i7RGg0O29GhKhClXBzuKhheOukmnd6ztCcWt47dTkkykLZdFveNGHGJlNbG2LQ4oCUE0IUioHWzXZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055642; c=relaxed/simple;
	bh=qphykZeRxA3Dm/sahKxkEFbK8FA+HtS1KvN3pqv/19E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnXARe/6U5GeGMfFD3py/boQLZc12s0ZcgEWCWAlOWsJidnWc8r8mJKiSJFbAT0bU2sPiZJGei4suh1RVBibgXjaKn84AshHJDhlqR0EKYqmV8qP6F3SjhWlVApEyBTlyEoyPNaRky24X3sQ1Az7kt42Egxif8vZtZin1c04LFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b209s6Je; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ52f/Og; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b209s6Je";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ52f/Og"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xZI12738645
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRZJ39RIeVlC9MlaNvNvmqPLISdXkSaEEscPGaGxyaE=; b=b209s6JerXmXYSXQ
	3HXDqVZvh0not3UsLCYTlKutDsK5OE6QGtKdw4cO3ckd9JvVioOxU4kwAOralrPK
	Hn2dNFyhN3yAGLTjVy7cbo8tG7xF0aCPkb/CDsSz1lxmJNng5qEPgwBjA6cIdp4U
	hIR0ir+rg7pqungrNDR35VelJXd3KUGVlUUHpXOk/I+gv+Y59ioVabLUkwa410NS
	yKdGzAXuoC4R7Sj9n2mfzk6a/8YZnhGR7hJCYlxpJomk954semw8leIfp5dqaB9R
	Hq7TMsTYurNT0aBtYkwNJsgwoi6rIa3dE2BvHPv+BUsjO5KyuKwVYL7jcH29Houi
	cQI4tg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds96tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:13:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338d5d0509so11029691cf.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055637; x=1792660437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRZJ39RIeVlC9MlaNvNvmqPLISdXkSaEEscPGaGxyaE=;
        b=JQ52f/Og80Sse8OpLLiYOxocx39wMix96TrAu7tzdrracvkuDn3gACxipaZMNht+c6
         YRBLONjiRwZApNiFIymWDbEB40LWjvG/vwn4JLKwZThe64DFBtM97sJ+LjmV/fiiu0Lc
         8dTpMXv5ZEt14qopC1MS78Pr042yJl70rJZaSVVIJ3wg6heDcf+puMWD90LAu5am8ZUE
         Sos3Fb2Ma3TnO0GxbD1zgpMd/yFyIouBvdL09Un3ZfmCh2olwSDWIaZKavx6Kg7uBowx
         k2BgT9tC1vqYF6l5ANvy6hU5xvyMV10UBLU1MN7VtZn4MWf8m1tH8a5yujgc/M/eW1j9
         I/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055637; x=1792660437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRZJ39RIeVlC9MlaNvNvmqPLISdXkSaEEscPGaGxyaE=;
        b=n+ILoY6pw1cbuPPswDi9AWVr8tAiTY358YgarkZOz2YPwKkKCOZd/QV+Svr0Jtpxh5
         5EOj6HxAo+Z2UezPtQZnEz/k5TQKTkv3v9SDmq1akAiCtK+lwbsNIWetm64sX2GGKqEB
         Oon8QXnZtRMdIUIohV29UCaDgegHKEnfm9a+dImEs5mUMj62JKIQfh9mCnump11gVUq7
         AmXQT773ht2vGEO079N3TuKfHtAj2WADKKoSbhXeo6mgU+a+0XT7ZoFsZHudN7iQ1rJk
         3cp9jKlw6Zhxuw/9tHhb4hJsYY9eVMOz5NGrhfH8HJt3ud+H/T3t8E3AlnSyqVPe9xOu
         VEMA==
X-Forwarded-Encrypted: i=1; AKwUvBx0S8hcLWouzmjYKn666cD2z6+paitRJGvQlj+a+CqOOLN7cuMc/2XQe1wmjsiIneBB9Vk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJqJ52B/m9w7eGlW8cDZFQAgLxCjuTN/4T7W2RDQwuoDK5KtumR
	Lic78QthNvXACp6Yey9FE6E1vzUFHTKzE6afThT+TfnMWITaIt9ZirigOVJOJHtqAeKpZqkhyeN
	NXS5y1ZunzGdLaDvdqrQntnWHs8GorHgay1oridfbCbnGO2u0RC9moC8=
X-Gm-Gg: AYBFou2JXSArpNrJoOjYBFor1RGnBizl+RgAbtF5MRLT6V+UFZikYj5DstHFZOI42Ia
	EV61DpzWfowsQd7985WSA1ImHRA7sDP7sfjQLeAKJeVOEL2JyEd6+j4AHCEpUcg6p3ry7ehbihT
	ERSnbisO4YjNPbS8hfLySkj62qErKcNiiGTIj0x5Vd19zUbTexEeG85tKjpQeRGI21v2txOfGNp
	NmtqP/4JzaxvmmosmsLWgdFjwBHJc9QcEikdbPVoamCGU2w6Ap4uOq9nKDpZhIEdUvWdKhPD8J2
	gngT3zPF3r8LoBUvGmJeayM8a0qwdeqNdO6D5LWnLOgYC1KG8atQ1uNcEhsXdsscUARLyt3/4e5
	XqB0QwtHCi3Z2PScmGzgKMg==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr354077311cf.0.1792055637376;
        Thu, 15 Oct 2026 02:13:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr354076771cf.0.1792055636583;
        Thu, 15 Oct 2026 02:13:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f0071777dsm87295266b.14.2026.10.15.02.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:13:55 -0700 (PDT)
Message-ID: <feb492d2-ec12-4077-9d5d-f1819586a41e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:13:52 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] backlight: qcom-wled: fix string detection brightness
 on WLED5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6R8o1JhoNgI385bYBB6luAu8LeJ4_Kg3
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad09956 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9VxvTDaDK-J1xIkbkncA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX46KaLLnsBia8
 OWlOz5Bi24XRQjQd6X4G277ySxMnwND+2elaFYTZXe1S2RzxYY2lh5exozhxzK7RQ5RJQG4AX/r
 x12o3QenXuC1fMKzKnYOkzRI+1LrARaTDgPZiiuGbikLEYeRIB2vbzXwgBTWHDmMm/cDU5AeZAg
 /3EZria1lroIosAuYllFvWf8hCpopwhKOehFOrZTAVFN9izLQp0Z6C6N5hchYVQTH3/Z2Xqd8aR
 tqaLr+9b7q5egfgtJ4zxH7Eic3mirYmc6tMMCGkKMRGTuBRv82vltfSdp9zQQzd2aDUYBD9J30s
 OKeFZomBTo+7xAyoSSEaBjZltIEZPc2ELUzJU29kfQHymyoDWJInraJUS+0lcSwYzr2zMkqgzbH
 qDRd2c7v9QuAIwahToq5+/4LXYxujle+UHa7JA1sAriqH6kRficaJzGVa66JyB5r9L0IGu2rtSt
 WIeYZs4H55z2AwAZSng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6CpjtRBQ1loR
 AcLArCI13rn535JWCW384TwpiEOc1wRUxcd4G9VvFwayKkfzwpINfGV0eJYx3cEctL6hwcM+Vpm
 Lue0B8PWnL+MEwZA+LkZE09blVHqkDg=
X-Proofpoint-GUID: 6R8o1JhoNgI385bYBB6luAu8LeJ4_Kg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The string detection sets the test brightness through
> wled4_set_brightness(). On WLED5 that writes to unrelated registers and
> the detection runs with whatever brightness has been programmed before.
> 
> Use the per-version callback and latch the new value on WLED5.
> 
> Fixes: 62a1d3f623ac ("backlight: qcom-wled: Add support for WLED5 peripheral that is present on PM8150L PMICs")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
