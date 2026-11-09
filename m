Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216143;
	b=zjKp1hYxvrtCrBgonZnaZxkBN7rFR7ifodi9uGNnjeCXFVOsv0Bi/xK1MbHeMsKdBb3U
	 czldYz9hHYw1p1d8kHg3/BQVgAFaGVNmHmXIJYdpYkaxi7tydVo9ABWNBmKzjTIEN920W
	 wzmVLTlURSvcy/HWXwBahQf51f4tv/qsFf59v0XboANfoDzuJLihpL8nhuMHiJtZx1o0j
	 RuHB3eZmFxmTLZUu5HobdhPHzQj5aoMk5X3PODzPUGelbXCdo/u80qcAyW8K4t5To0A9i
	 j8ilSh7k8yBRU8YlypmiOk+eMhx5tmyHYZLXCw8SkUvJC4jnj3K5bBKKf4I+C19QV8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
	b=5SJ8Nn1UA/g1EeA7kPRn4oQorrnGQDDCLdsQe3gq/MYhnlKV/TP20ckXkkABfAEoC0bl
	 MsL8grb9cT1l+otyeKmxUw0HBLdbeqInzDFoc877dotdC3AfrAaWOeXrIQHguvdmB2QAp
	 zV05F+R1dvZbyQRl9JvBofY1pn5dSgeyFyHlMG9LYbL5JJF9ujAm1Ioo529RqGaqx1BzC
	 jtUVpYZtBydGIW0oUZx9JJiQRP8+l3vp9S1Wh0k3vMaNqmkrtMCovQ3SLcdAgPPqFWRVY
	 L09eEttEDn+giMBwfBvHd3B+srK9DAZj8aqUCt5K4/ibZNfC42QK+o+KgiAvojaFl4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xhp4Uh8b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2IA9cEx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA6D606A33B
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 09:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA6D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xhp4Uh8b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2IA9cEx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AAOs3634461
	for <mfd@lists.linux.dev>; Mon, 9 Nov 2026 09:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=; b=Xhp4Uh8bdhrJRRQV
	uDXW/AmMWvmeOivl596b5kERmWL0fr2ULx3zuE/qKyLBYO9HPvq3q9fGk+iRiOnt
	V4GYv7E06E+n6/fw/j8qticBygQ3Gnu3/0iNqlLveYLDzDNtpxWX/S0jfWhfqZu4
	uGVHmEU1ykDuhMfjANf+rZsjsd9pCmkRoh63ZQVMSOn9pW7wMc1eYVMmrOxL2E7I
	UkzLo+yRvjDCjOSY6pOolDYv8LtXQQxFJf09biu6of3QFvPolBfUkE+nznD5krLd
	ZiOdhoHp2xTBNX3CENrgAy9yi5DxnuE1h18BQnWjaQDKpBXhcgO2x5ofPJCEyCPD
	PdmMaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h08h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 09:22:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so11086385a.2
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216141; x=1794820941; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
        b=J2IA9cEx9ZXFpJCla2NDJu8OFeW8MEc9sa+/oTAmhjqWe6A1aBVM03Ma23UzTMt/cR
         lfrz8X6Ez1/LH1aV00Nyw3LlYEiiSwmhvitiRrYp54kXz7ZcJWmYTHRFlM5QErIyr102
         N/P5l3564/hrLwAqBER3KEbLCnyiArdU25cPMx5+MmHtPWh/Nas+Lhe+gGJNfwzT0v1k
         4IfXg+fxCW5vF936b9mvpScvkvvNuPOiQ2YNMNyqVv6gAGzodFIDld35VMMllZs9yOR5
         BfOickBdDPEABV6sDxI7xn6mHjpav4IxPjOYKp4fnFrhpturhJtZbX4Qbth4S7/7d/w8
         eWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216141; x=1794820941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
        b=PJueV2/mMYzG2e7vBRbirWAO1HNMKtq8cgzNaCHmeM9I6s4AbGukO8FmoQ96/UZN8/
         l70go3jjk5HwdIiJrsWoYVJXwiLR4wxGly28PLNJKz8TZWGS1VS/F6JiwOjcpDB6zFh9
         Va6OYZx2g07F+hqI6nO/O4E/x4SwHYJaW1UerbhjIr1w+INVPZCvxjwcIGxYsIGzMHjN
         LCsbEL+83CB+K/DvXLqdWY4nqzeMUOcvTSou5m+j6FG7hsAKF9hSH+2Hg8K5Bxtq8bIG
         1RPcvUTLbu40nHnzk7SHXRDaDdH4JSub5/ITqiC2ItMe3PAQDtkqrdRJ7GSG6H1Yx9qj
         FVRQ==
X-Forwarded-Encrypted: i=1; AL+hErFWxxzDbEAinQVIYD5QF5jD0Dc2Z/UzOJL8VNo76v/dxfN2zWvubMNQpItElc4PrspzqAs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+z0GDY8yDZuIqr+HwPf/kAftd3C9wgsaJemUDWE9Ngrsz4Qx/o
	3lhAb2TelxrGIr3i0MPkCoSmlE8AWMI/oEC72svx+ei2pjKfyi7A5n6B16Ml/NIPD+TxxNkxlVM
	y+bQtckMQtCNv2lA+OoEkvW3xWRtou9YumCcmsjB6B0LuXQR7OoSmi1s=
X-Gm-Gg: AYBFou3j10kLtjJ7ivH/A3saD0naMOnynPCb48oEx0yFk0MtHUqQdXSF7RHN10gs2n/
	673xFTvtzmdQ0Zp3Q4nhVnahIqJRDYGxBIlO6Vpw/1BRYCkPs4RSCOP6Ek3cY5e+QyZape4FCpO
	Yu/d3eg8wJg05ozA6J2p1iNgs9NSCPb8dCZzFEnOLIjyhUZInL8Y8IISB21AMhg4kFTJhZNxUEF
	ZO/WXc1jOm/5/7hOkLP6hBUWA4pPLFoWUYnlkaz715s+GjkIs7xPhzABmv05K9bc8bk7Iw92ntU
	ygOZHBihYFWezlPeXaaRqKp9bTzw8c1jkzvPa+4HKlbbeuTsnVvvMGd+v583QKv/5ByYexZ+OQ9
	E1cQ9OZuWaB+ARydQMIH3Sx3yxaXUNHNdPwDkI5kq5A6rH6D+bpIIgS4N+cpqDGOZ+5Zh6Q==
X-Received: by 2002:a05:620a:a913:b0:93f:a34:d9fa with SMTP id af79cd13be357-947840f2208mr612806385a.1.1794216141017;
        Mon, 09 Nov 2026 01:22:21 -0800 (PST)
X-Received: by 2002:a05:620a:a913:b0:93f:a34:d9fa with SMTP id af79cd13be357-947840f2208mr612803685a.1.1794216140461;
        Mon, 09 Nov 2026 01:22:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474be5sm136556866b.37.2026.11.09.01.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:22:19 -0800 (PST)
Message-ID: <f32b7d48-62dd-48ad-81bc-9b0aff61b863@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:22:18 +0100
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
Subject: Re: [PATCH 1/2] mfd: qcom-pm8xxx: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
 <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af190cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=2mfksfQnj69i5T-jYpIA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXyvXA+8s2or8q
 0Fxeetybmhi6WvUDuP3xcY7EWt7XTIyjp10enBlvmXkMXDfP5Nhy86Kb0eROLrLztmnGNW38Sie
 vlu39K0DOpo00JUSOOciJxcc6srHXeRoAlba8jJsSsnPLmczAMpCs2KO5H5Sd48TRRuxEd0puq6
 sPjlTsJ2omgAu5m9fhZ7WzQ76mVQT68IOM3uQT7J5drFERmtv7babfljLJyPNz5LklfzeU0dQEk
 qFT0US4YuDamuSyXBQLxBH1k6EjHII7dDgbc1xFA0JgNR4XwKI2HpinHCBPDUVoZMFY2QMnegaT
 owXglRWa5FlvaHDsSQbDw/7N7ZsVO4JcS34ZyxACSqZjrZybHCiU9JFKRkQ1lfvY0ATzrQqKC0+
 NAmZlVf8GEHv2fHvVxsutnhPaIZVXUoIbJq/oSXeUE4N3waWgCN0btc5iDTtYHjlh7Nuj0QNXBq
 NnMCAQP4o6fl5n3KnXQ==
X-Proofpoint-GUID: SHr4YXqLKDStRlqGHz9uGpH4iGJW66Mu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX3FzwJ1ap6PUp
 5nNNK+zjP9U2RR54OONjU9poL/bBWx4JAeVgGIMHrFoW8jP5tbEJJu8LG1D7fNUzSbxXErVfpGx
 MwC0wc0iyVsgS011K/qyaRq9dSFl84k=
X-Proofpoint-ORIG-GUID: SHr4YXqLKDStRlqGHz9uGpH4iGJW66Mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 1:20 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
