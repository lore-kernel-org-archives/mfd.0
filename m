Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B174E73C6
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055527; cv=none; b=XvazPQ77aDf94YPomVgBHAAc31PfxaHyoSwBYNMumh2KJq6QEEiOH/9dy0pwVNY7t7TP7M86BFPDh6dDghRRAuK5ZB5bAp9VNsXr6w+ZuxOy7cAWs2Z91qSvFSIeSII9zcZC/eMj8UyJzHG2DcV9KJKSQSEaktFkC0oNm7Il0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055527; c=relaxed/simple;
	bh=14UNhDwSqIGwxH8eFCUOb/Ru8LN9tAiu4BmjCrwghaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqrr0zk9knshqub3dgEfIDB5ZRHdUQqh8OtUl2DCufH+01dvcIbiyGK+do/kCNAmfNfUUdn02TNjokngrF173cPou5tx0ywchBPfxyFNuu0uqvtOoEcNkSBdFNGqfJVJs4mQUNwOmsDA/8aPfc8tZbELSsPG0X0IF4aJtTEL15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMNRiQwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExwbE3hs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMNRiQwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExwbE3hs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7l80d3468940
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=; b=aMNRiQwIIFWHlTal
	SIMFgwXbrdTzdpk6c7h5Fcz1W4YB/+YEt+u2yda6R1bMQEhvFAFGefcMhLVx4d6b
	cfrx+yJtHLY24a0xFmPGjI0TgUQS36D3YZFADs+ib07/NM0eNuP5HDMeuDPBF3Az
	FE0Z4+ApkZAntbkmtGmpDzjqllBIQo7FPDXkmRcQRKc1iTBOo23zjKxOiDzxLtxE
	xDEGP6YBLly6OPtftIC1XGtF7RpjLajAgWFHSsXoFHXniHNU0lpjME4SKEJ2w/rM
	bjC4ShzKR1cvtLxdqSckr/Y/1bkdqM0G8UOZUmBocuZ4WnZLj6N7+WgYxtkOgZ+m
	oXxSjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bey3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:12:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f0aa07824so13087785a.0
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055524; x=1792660324; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=;
        b=ExwbE3hsSULDyOb3wZjROO/cWV7QzfvTEiV9arw+21aRBbF7uIw6ul5kH4IZf2ScSj
         ul80+l0E6fpUGS3BOnrTkMnqaeMB/u4BjHrSod1IbP8L143PLIJnFIbfY7M6GDJF2fnM
         acb3LHfKnr3bbentosbfMYhdGoPkkFNp5dvPLCDznxjBaJxltQl9fwKSxkSQMMG3QkOD
         rpetGUJ0/b9xdKVMM7oOjdaCgzNYGxePmmL5g0ezvsieGQtn7/PRc+GkWnQ6Ej8wsLmo
         KIFvJjtgA7WufVxWBGumVc0rlXPSSifbZSbn0+M8ppFSNlud9gZvJ8fMeN5SGiE+8Fgh
         uajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055524; x=1792660324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=;
        b=UsV0OrswO6bwkFoNHTZBXIH0xwDC3OVrbiYsMTmx9ja7vGDvBPwa6LewXzoFJV64FY
         YAFmC7pKjx6ZRBT7x4HZxfcb9ysQeMp21xhbdSZHwsPpRwiEJoeuyHYVWHqlA7y6BXCi
         huegP8Xnl1h6rD91ufCsSH2lr7/G0ZcXUycm6KmJxZSAguBe8RugTACjVH+0yVIY8Ipo
         0NpShxmYtxVy2p3dwJNdUzErjGQBhcDjn749EzQmx2ZKgqkQkZtzC+XSCiHL5fQo7BJ9
         PP8W75wgo/uaKlu09hR6SV9sct5ZovCRNnr8kBUh/cn52rvqRtSMrRPrJCekdz9qGgJH
         oX2A==
X-Forwarded-Encrypted: i=1; AKwUvBxQoSNDqI25IkROHb27xx6v1mve84tEv3RHANpYCSJZgPjvkJxviox4OVdJ/DAi+8yTWdc=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9MBHPBMaJ++8m2fxhRnu2AoQFoT5CKTNwR6uJ2bgU30xun0bF
	/9qnCyf2/EyEuCvUrCbD40WNLy5tgXlgiNAQACBuIidWtS8CGRo8TfvCezfCVEwprF2aGO4ZGlP
	m8pyZqhpCBzkPp2tUcPzqy/u8JizL7JNK0PK2z7HmvhhYbyhz/Vt+whg=
X-Gm-Gg: AYBFou3aaLiLI8LcJmw7UWWtg1LvuGQ+et1PRIuO/5JPBOYqlxWiGSGTaStdd82Rr9z
	dIzJtvQtJi1i0rYiTTzG5mrIOpwd1KeEt9eIp4dJ3fuD4yFDvGMOUzLUUtKdrzylpWbqda7eGsU
	L5nrG9UiHUR0cm/wYpL5FB21crOpasLXTNb/jGd6Qj5uDwhdNdgxAPNiz0YrPCA+/aMlOYupdg/
	Gu7cwYfSeetJwL5KyyMPiu8h7mrlmYUI4lu5xZaiIFVbF8RLbHIwis8eUVJwZr0f3mPFCAGFNKB
	rk0caSfhk4LXCCt5F77SEEvY/lG7A91TNzD5hlZ5kNtX+AFZFd1Q2PK7HBmFI6tBIVtEGCcqARR
	RZ/ve5lyqz1v2ZK3LEf317A==
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3112658685a.2.1792055524100;
        Thu, 15 Oct 2026 02:12:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3112654885a.2.1792055523631;
        Thu, 15 Oct 2026 02:12:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388c1f1sm2263767a12.26.2026.10.15.02.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:12:02 -0700 (PDT)
Message-ID: <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:58 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
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
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad098e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3BQMGBUH80HoBbyhx_0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4r5hQGW6yh6WSQSfsufQvbJqS-E4pwkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX4mM0GNsjviTq
 L8al0dk1uAuvq6SGgkYfuEm1tW/LsExxdBLrVdRIcWy8fJ0hZvM7tjTPGpyVkc0c6Pk0Kw7lFzc
 JDEYIfmLu1lIpRDVLEP3bCstMZwFueN6S/hutnWGeEAFuryOW3xsq4uvBMn5wOQCkWJH1kAzUOq
 qd02fO0xJEy8i8hJ6z0W7VhSR5rsqZGpP6uor0cdL/F93OnyXuU0IMDkNqqHXdN/oWspu8ZBI4L
 geyNtqOrMxeuK52XHEg43vIcZrCC3JQz1XH95697ifyK27085lbbIXcoz0LeTjQdDHTYkTsdBH7
 I6lnHHnKav+9gKwdwPgj2G8l5MqoYB8/3wrLgCkEi6v8pSizOZDj+Rg/2jasGVwypkMvkB3VxMY
 vS1goMm9I4wn2W1oIUPzPoWSLqtCSxS70mKa2QD8b0OWvysy3h7fJLgJGpKhYmteCrxSv+NB85A
 TTADpzBSlhnuKicm1vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX0wBTbwWZKpRl
 ik928qjGRf10RBBIyGgvVxS2pWijq7JBSHxU010nkvsRRaAhiQg+RFYjUSt6OjWNBZptnBMCdCq
 UH1SLnIiy2Yu5wgdRXWCIa7LL4WqKoQ=
X-Proofpoint-ORIG-GUID: 4r5hQGW6yh6WSQSfsufQvbJqS-E4pwkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> If the bootloader leaves the WLED module enabled, the OVP interrupt is
> left enabled at probe time. The first brightness update then schedules
> wled_ovp_work(), which enables the interrupt for a second time and
> triggers the "Unbalanced enable for IRQ" warning.
> 
> Track whether the driver has disabled the interrupt and only enable it
> back in that case.
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This was merged yesterday:

https://lore.kernel.org/lkml/20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz/

Konrad
