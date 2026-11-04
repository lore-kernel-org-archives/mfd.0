Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795416;
	b=Ittrz/B3ypv9eNBGgJEr/2glkrjkZnXXTwzcwuXfLM075aZ+/JQAUR425xx8nzDZY++0
	 mXYCha6MTzGNjqo9v6e1K719GFanJajIPNBltv8NYhS7OFKkY7YCnaa5xIHGRb7eJF2r7
	 SZTbWpp6dEuk2blDEG5LPesW285Iy7yb95gQ/tKFO0QPDosHUqb9WRTmTFFh6jNJ/sv5G
	 EjQr50djRHqdaJTFKojLjg3Zbp6PgwTazqiCo7eJVYPaZXgwR01Z9iRYaAvQfYmjcENyf
	 gcecEC4vVKMdfJ8QLHhIhBnSZcN3nefvToT8Pl+4gQRu67u0zFYhhXRZLHjp84nNhkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
	b=gPAyk2mdXbXdddPVBmew0A2VS33mW7ajSrmccbFmcdbDP4mv8wbswDsxJCd+kWo6zRJG
	 Pw8w+w3O6UsXEwf2rL/XtpxDJEnRuei4sxNqlJOiS62u3fWWqiZzJq4S6yR6Ta5WRjRgp
	 H/42xNF555IW1YG9kUa03On9VaM40WTctysrBJ5AJFOl53w11ZfgyEEGZvxKLrtzkACJr
	 K7jluH7pXBwMg/2mj9KaAuU4v9hrLM/OivmY8Tbf962rfFaZCnQSO9dl5oj3Qj0KpW04a
	 XFk4VtYaWXa3FW3Vd1XczpZPqPFdlAGSETrDpEb0BSIngZP+A43PD9fe1JbKoObkEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQvOdCw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Lgw/Bn7z";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B08606A31B
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B08606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQvOdCw8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lgw/Bn7z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZwEl1667616
	for <mfd@lists.linux.dev>; Wed, 4 Nov 2026 12:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=; b=OQvOdCw8iR3/Qpcn
	RAPANZBLVtI/4IxZVS5zfn5LSC2uFk+caGz9dlK9yy8iBboSuW3HwgAk5y/p8M6A
	9GODdQVIOi0k/CkRvH2pMRxgBrc8A/qXk1AHvf+KLtBmIj5Jq0HZlsSGwnAkhvvF
	tJnmCZL1fHdbWBOmfgd9AGgnZyDPuW/QT6fmi3JgX6ZlBYAVcWblcVhd6jHGPtT9
	0mwIUMAJ4EWCi5xJCRX4gP1dcYAYMx3tK1TPJ3wREWRibA9q6B/o1GseqSgbFYhN
	hjBeNFc/ivN0vf5iSFdKM1ehx0QFn2kolc1Pnyc6Z0EmhI5D3fwXuircSH23i1JA
	Z9I4PA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nkt5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 12:30:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-998f1ee9698so13212241.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795414; x=1794400214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=Lgw/Bn7zc5gdix8C5lX7NIq/L18XrO08dwvW/P4EQzehvypOJP0kA+hGTh/JyPHkv0
         8llbn+f9dAnCuDEynpeNH7winlGGUpK+Fnjq2nEpdd2gwW85ElsMyMLHjOTR6+KDtI6C
         7slr5YN6oryKG1IbAOMIeqtDgMhaaAKKlilmeIW2ennGhdl8HKgFrYPyt6wH2csn55YX
         dRs2Z6YYgrSAvHk5gMF779hwDBLh6t8kFzDmuUs9N2oPaUAtCSbgNBFcaR2zygygfAdm
         +PwN2AgIFcp4ulv4axkR0yTSqBqCKHq7igrmI1FbNQpfiqFIQac8uuARSiRSnxDo0iEB
         nLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795414; x=1794400214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=oIUw7rW4bX2XA9hXzUzwSklQYAEvASbhXVN6CbteqqInPfJx5sXLtQv2+OSkKwfiRZ
         Rmt+4HPaZdynTywYuLDJ4/B9HqpqSXw+WzVFvZbyXFc5YpilGySdOMheCtTZ+Ea4dlI+
         /yjrDEWej8sJStaGCU7eYb+Nqj5uXIqkKaBy9BJGubhWq2jeB6LQapIuDkGAg+Brtyu+
         bNumcgQhg4HrMgfqz/b5VrMJGgiof0uXGImGq0prlyHHqcBGioJS4mZmYgwJJ+CV/B0h
         Ise44v1l4VNXIpo6NBWsxwnkW8r8p7zUPJHl0PchsPhSyLWTvNKGiKEhKpySxsjJ3Gmf
         /1nA==
X-Forwarded-Encrypted: i=1; AKwUvByKowLX7G20/Zvum0QxUhbhQJpxbA6Oeusx83EB5pRuTA37nq+reVUF0FnKErIXmOlnLKA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9KzAp18f2X/javPPC2sYxRvsPatc9OdLvCoAIZy2zWkcCN6/LY
	TaOGHXQTDgJJrevVuuaU4OVMURy5K8Rlp8JpR77urk4ENeZ1FkplVX9BQoh+fch/z6MdJ8XVtpd
	cr53D2j7epIcDC2e/a2HIqpZZ3KoVo/RzEvUrYMO9dg0TvdvgpG0861s=
X-Gm-Gg: AYBFou2Zo7paAHSqbQiYG7ySpStwVc6e8Yzvdk+ATSdTMY3s2ctauwVTJ0tsfBjW+gb
	PFfw4uocZ9EQ7exshYfBljOqnfMgK1gHJx1MUdS8qPKf4dfDB0BaBrTTv0GQvxO+fZ4Z5RiWAFW
	vH/tORaWQWGkMutUS1Qm+JLbsCQo/MbdNXgzD7e7O/QzKkiaqTeK0MFd7RVSmUCSy8NKUmr7omt
	kKTSXjdhvLDII8HF/yRUzjqqReMGYp1nh1JUlNZwJg8OZbU3H0QFErMLCOS+TDNC8Woks3fNZqB
	rqYxMF2F6hYksdwWn3m5/Oddwb3Q7iblZvocW5hBxdzPd0bQns5iBkqqJ+GxVis6L49hiIxjQTL
	obPj+R9oiyVG/nQj94RZBlcALmrArMip6rNXFUx6N62KYR2ahgiKj1g==
X-Received: by 2002:a05:6122:12bb:b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec6897034bmr6619480e0c.5.1793795414015;
        Wed, 04 Nov 2026 04:30:14 -0800 (PST)
X-Received: by 2002:a05:6122:12bb:b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec6897034bmr6619402e0c.5.1793795413275;
        Wed, 04 Nov 2026 04:30:13 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a48f8sm62828266b.79.2026.11.04.04.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:30:12 -0800 (PST)
Message-ID: <2d8f4e21-9ee0-4538-b5c8-dcd159d40dd9@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:30:11 +0100
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX040qMu8zXGCg
 DYtcbfD+cyeYO0geXY/hciXcRkRNb78rfnyLO15rHkDtdOEqO8fFIQ2Yo8Ht4D+KljMJ6uRnn9e
 KH+UKcSocrxakbhKPMIdsW9z0R0ahgVWRSmNzaGl7svGiLUWv4ORvM8QyvH68YsKwGdLwy7/18q
 yQ0niT02pw0KR+VyNp5i3DrIZX55X6LoAlTGNcmWBrOjLM7z54zXy4I8BKogSnuhxtBwieqyXs5
 aPIF28pQ2HaHVCEj5XPVPO2EPdkMuc4Q60+Iwirj8q5M36HKueBbYJ4tMzDx9nbR/uGDEyYzYDo
 9i/4H2ugXJjRVaKN/Vg7r/nQA7+UYRthLzUPvyJ79QGbZmi7n1myVCMjj3JgsZq+pHHGLMr68uH
 za/lbGPlVwaHZ7lPWzbfbL3sDxcmowAhGv5Y1V7lu9KhvaCLreLWSjeTuHzDdEUdHdeQMmrBipe
 VmSQgnz7yoiNvJEBSfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXyFWPVKKOdfdU
 2yujq8Ldd5M84Ho/sSTOgQKL6HLd+sdG/hnkYN5AXuKIbfiRPSi458t1lEkhsLyt/PzoCsa92WA
 E0DgsoOsz8Dce2uePjLMyXLtZWkrHQE=
X-Proofpoint-GUID: nQqH-R0RqlVjiPtgf8TNCaWuj6LWkpHA
X-Proofpoint-ORIG-GUID: nQqH-R0RqlVjiPtgf8TNCaWuj6LWkpHA
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb2557 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On 11/4/26 12:33 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
