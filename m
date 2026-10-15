Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796304EFFD2
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065746; cv=none; b=Mm712PF+nyJloMhdZfRVGDcUfYZZ2mlrjk/rzJp0cpinFaQrhr9Akjzfx/n9SXCiVODVliLEP5lQVdYePCmwQubcb3AlJuNCv/GeAWX11Xd/N34l37jDc6PmJGMUVxtk160EkxdVxa37NWaQS9/0CXe7AqjR7wMUXgKW1E0gp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065746; c=relaxed/simple;
	bh=RW90kX5UXhPbMuU773cswcseDtRVTNo/H9SZj3A2zhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLT6TujtAmv1KYTaFH3kDKtEPmIKJ+qR3IZmkCl0NQMywpZkVpguEQdA6jxpvoQ8k3BkMCIWFswGNK7tncet3wMPDxS+81MFpC0MOqRjH6+PeZNNtC2D+Twv4w3wPrHqTQ1MV31vnI8hOvxPwTKj7znep3mZCTYd5zgXcgr6Bkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO1T7zJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoWK08I+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO1T7zJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoWK08I+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdCV4100193
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=; b=RO1T7zJENzrvXhIg
	kZIGA6hBp107Y2ZD3YxOskODR/SK3vv+O9N6rpbOmPOi7uy9zaIJ0ZMmgTjwMph6
	J/ci8p92bafH3WGxWJ/LRCBtHIreig7rai0GT/rHF23Udy61e2jw85RzTIJZjbcj
	coanBk27K8kCtxLczcKA8P2N1f09oUNEkXkQu/9jmbdWI8X5zCrE3V5E0l+mHo4f
	A/Upnd6GnOZSvbHwyfbASbpgavZJPAxsPqsU1whYHPt5Dj1j+BWO1WtpZLKzbcwO
	E+fcG5f8TkPBbk2qKREDZrRr6mx5ly69jXfDt2tWYcQ1ZHCzRgPB+rd9yt6zXR06
	BntBWA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8b1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:02:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e705718bebso180248e0c.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065743; x=1792670543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=eoWK08I+q5XDn+vLBcuhGU0YxPIilNrpxQsAxpSsRUZnBU6lJnJHgoOC1r0cK8m9wq
         WSIfNMFahl0zaq8Bfwfz8UTj/qo6kYrixJxKR/jGFDCN+kqblEtK2UPeHXAjlJSxYIam
         qky3EzXkHi659ma7A+WGliOC4QLjVTtov8ACdD5RK66jg1Xc9fIMjhgzrfsJ+k4LIuof
         oPtP7c1x/zvgPuh1WH94DIsECaLAfKBGXNCfl4IfRH7ahh3r2VRPadZ7WrRGBmzTvBTt
         64YVRAS/Xm3SQpMfCQKmvuYyVZ0m/89868Q3oo/gzz2ixHBJLy1ObC1Uum+BgCBa6mmi
         7OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065743; x=1792670543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=bdWTaY1JHKdDOs45IauVtX2sJ96P5Iw8F9cgfKg5dst3m/RunQ34hrneWASlO5U2Q4
         bxuKh3hTVKKpTKzfUAzyJyJjZt5lIqAhKPgfpnEEGbCkoIDyldsggp81mr6Q93+Lugiw
         +sO2zriTBPhgAmgJlnOz3bIxo312XRlKJllPE533kg9SHcdHvLKgbtE/SxoBc55Chnt0
         qop33O61D0fQvuqrvuBYIMB0xKbMrSzYs8Cm6Tf3A/0iNC9gBFFAElomM4e4UnhqUsZw
         W8lo0UAJKxz64WtaJso/Ly2+daJljloTdWylPDVrbc++69x+Jkc0Y7aS4gHsAOLbJb/D
         nB0g==
X-Forwarded-Encrypted: i=1; AKwUvByZ6HEDYqfMqAk6waE6SWtnl7QNYZArdIy1p03Nj/kL71biQuUP5JcVMdJ4fqrwxMqMpTs=@lists.linux.dev
X-Gm-Message-State: AFq9FYKDlNDUo6a7/+do+a53J0vHe9pJREVsIPqMCCxuYc56BFmDUru3
	Kls5abWrXuJMp/djlrGtXf8BF4BRTzVCfdW+HIKGSJ68PnRCEyzt0lkK56CpDKrAC/Qciy2VhmQ
	bai5sZtxVgbobSfLT0ewXxw6LT4C2620hiPzzNXuqabk2I8iQIHHF0VA=
X-Gm-Gg: AYBFou1rKSYW3xXD2dJ+hdNMfyhPSsnmRkMjKy3dhZg2Bw+EYj3PL5XTV7+WvGNq4Ot
	cA0uQT6guGGusnGpdgoYevWPvoDvzn/VcNs4DPQjwNfJS7ywnus9u3+OkkXl5mQd2gBCw+QfR73
	CwoovbiSAwBgmm+sHRYRVj+/x62RD4MesxlhktbeB++jgPrnPuDmLHKH+o6ZW/mumTnkCIVzT45
	A0YLYzljXAstxEzFikzGGrgNC/PeDIj6eNng44Rl1vGUiZcrYq2o4lCSVICuS5yhs7TK4jpUWqD
	E0bUwP3X2C67/qeY9f2wceS9bhymRKSe8SqPJV2rN9qrh/eQHVejRVO0IVbSV2FtLYQn+nw0O1k
	YCueJa5HWLmzLPytHln7mXA==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905786e0c.0.1792065732563;
        Thu, 15 Oct 2026 05:02:12 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905083e0c.0.1792065723319;
        Thu, 15 Oct 2026 05:02:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda6276a5sm114642166b.71.2026.10.15.05.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:02:01 -0700 (PDT)
Message-ID: <8cbbdd41-f3aa-413f-a520-749abb8543ee@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:01:58 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfXyX7qn2R99V+M
 H5lP2uSpaf2mH6E3Ialsv7v9uj1hf8Ww7my2G4B83O1iSoE+QA4ZxGBl1nM2qdb1IZhUqrNr32a
 +5Nm/wNiHfARJOh4aUikISkd+y411VM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX8YOW/UYQ8cSp
 v/Dz8rU+TImLZ2VCRu9WMaUImEcXxI5v8yN/2vRg6R2RwL2gwJYZavWrQN7U5rU7D4uUdI5sZ3T
 RuKoHEW2kL82n0CZG0GZE+FA5ZOw8VGA0lLqMNK6Zu8kI47lUrWQLTGynpQtaLlQ4/i6LBs5a6y
 fjB8ElMybNA5abAkCXg+uyuoMt/G+Hp/owiThJIbfU0u5DflFxe3/HtJJRnlWZ7lxtwB2FwhgUN
 g574dmOScr1NrP2ImkVwpDZOhtiC1K5ZUV17fj+0sL9vTpBZcRIPOxggKNpE4QSpTlA0/TisdWC
 7CxwPrlLIHyIumosTVFz2DeXa2GmVsYyUWayILhWE0aWOaBjvkkuHwKGk8oTDZf0o/dZw0xg527
 vP0TA6aYbgMAphbZC0HTBUVEsq7yftObQqge/JfZ/gvxBNjzYRu+PQqDzrSZRPu3zUVjz7zbFnR
 7bKPffOjq0UEyCQK1jQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0c0d0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZWiXTBPgYML2d7b_3NEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: DEtSQjG3poHCcaXDTcoS55IiDI2ut8zn
X-Proofpoint-ORIG-GUID: DEtSQjG3poHCcaXDTcoS55IiDI2ut8zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> GPIOs used on PM8008 and also the upcoming PM8010 have fixed
> functions (reset and interrupt input functionality) so it is
> not useful to expose them for general-purpose usage. Drop the
> GPIO MFD cell and associated peripheral definitions.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
